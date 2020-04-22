class ListTasks {
  String taskTitle;
  bool isTaskDone;

  ListTasks({this.taskTitle, this.isTaskDone = false});

  void isTrigger() {
    isTaskDone = !isTaskDone;
  }

}
