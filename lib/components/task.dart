import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class Task extends StatelessWidget {
  const Task({
    Key? key,
    required this.task,
    required this.onTaskChange,
    required this.onTaskDelete
  }) : super(key: key);
  final TaskModel task;
  final onTaskChange;
  final onTaskDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        onTap: (){
          onTaskChange(task);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        tileColor: Colors.white,
        leading: Icon(
          task.done! ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blueAccent,
        ),
        title: Text(
          task.taskText!,
          style: TextStyle(
            decoration: task.done! ? TextDecoration.lineThrough : null,
            color: task.done! ? Colors.grey : Colors.black,
          ),
        ),
        trailing: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(
            onPressed: (){
              onTaskDelete(task.id);
            },
            icon: Icon(Icons.delete,size: 16,),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
