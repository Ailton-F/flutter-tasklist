import 'package:flutter/material.dart';
import 'package:todolist/components/task.dart';
import 'package:todolist/models/task.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tasklist = TaskModel.TasksList();
  List<TaskModel> searchList = [];
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    searchList = tasklist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15,),
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          children: [
            _searchBox(),
            Expanded(
                child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 48,
                      bottom: 16,
                    ),
                    child: const Text(
                      'All tasks: ',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  for(TaskModel task in searchList.reversed)
                    Task(
                      task: task,
                      onTaskChange: _handleTaskChange,
                      onTaskDelete: _handleTaskDelete,
                    ),
                ],
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 16,
                        right: 16,
                        left: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: 'New Task',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 4),
                    child: ElevatedButton(
                      onPressed: (){
                        _createTask(textController.text);
                      },
                      child: const Icon(Icons.add, size: 40,),
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }

  void _handleTaskChange(TaskModel t){
    setState(() {
      t.done = !t.done!;
    });
  }

  void _handleTaskDelete(String id){
    setState(() {
      tasklist.removeWhere((element) => element.id == id);
    });
  }

  void _createTask(String taskText){
    setState(() {
      tasklist.add(
          TaskModel(
              id: DateTime.now().millisecond.toString(),
              taskText: taskText
          )
      );
    });
    textController.clear();
  }

  void _filter(String filterBy){
    List<TaskModel> results = [];

    if(filterBy.isEmpty){
      results = tasklist;
    } else {
      results = tasklist.where((item)=>
        item.taskText!.toLowerCase().contains(filterBy.toLowerCase())
      ).toList();
    }

    setState(() {
      searchList = results;
    });
  }

  AppBar _appBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Icon(Icons.menu, color: Colors.black45,),
    );
  }

  Container _searchBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (val) => _filter(val),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Colors.black45,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 20,
          ),
          border: InputBorder.none,
          hintText: 'Search task here',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}


