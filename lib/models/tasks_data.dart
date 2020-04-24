import 'package:todoeyapp/models/store_tasks.dart';
import 'package:todoeyapp/models/list_of_tasks.dart';
import 'package:flutter/cupertino.dart';

class TasksData extends ChangeNotifier{


  List<ListTasks> _tasks = [];

  Future<void> readSavedTasks() async {
    _tasks = await DataStorage().readTasks();
    notifyListeners();
  }

  ListTasks getTaskObject(index)=> _tasks[index];

  //Below is the way to protect list
/*  UnmodifiableListView<ListTasks> get tasks{
    return UnmodifiableListView(_tasks);
  }*/
  int taskCount()=>_tasks.length;

  String getTaskTitle(int index)=>_tasks[index].taskTitle;

  bool getTaskStatus(int index)=>_tasks[index].isTaskDone;



  void addNewTask(String taskAdded){
    final ListTasks newTask = ListTasks(taskTitle: taskAdded);
    _tasks.add(newTask);
    DataStorage(tasks: _tasks).storeTasks();
    notifyListeners();
  }
  void deleteTask(ListTasks task){
    _tasks.remove(task);
    DataStorage(tasks: _tasks).storeTasks();
    notifyListeners();
  }

  void checkBoxStatusChange(int index){
    _tasks[index].isTaskDone=!_tasks[index].isTaskDone;
    DataStorage(tasks: _tasks).storeTasks();
    notifyListeners();
  }

}