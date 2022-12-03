class TaskModel{
  String? id;
  String? taskText;
  bool? done;

  TaskModel({
    required this.id,
    required this.taskText,
    this.done = false,
  });

  static List<TaskModel> TasksList(){
    return [
      TaskModel(id: '01', taskText: 'Falar pra karol que eu amo ela', done: true),
      TaskModel(id: '02', taskText: 'Estudar flutter', done: true),
      TaskModel(id: '03', taskText: 'Parar de ser assim', ),
      TaskModel(id: '04', taskText: 'Exaltar a beleza da minha namorada', ),
    ];
  }
}