class Task {
  final String nameOfTheTask;
  bool taskStatus;

  //adding default values.
  Task({this.nameOfTheTask, this.taskStatus = false});

  void updateTaskStatus() {
    taskStatus = !taskStatus;
  }
}
