import 'package:todoeyapp/models/list_of_tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoeyapp/models/tasks_data.dart';

class DataStorage{

  List<ListTasks> tasks;

  DataStorage({this.tasks});



  void storeTasks()async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_tasks';
    final value = ConvertData.convertObjectListToStringList(tasks);
    prefs.setStringList(key,value);
  }
  Future<List<ListTasks>> readTasks() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'my_tasks';
    final value = prefs.getStringList(key) ?? ['Nan;true'];
    final valueInObjectList = ConvertData.convertStringListToObjectList(value);
    print('$value and ${valueInObjectList.length}');
    return Future.value(valueInObjectList);
  }

}

class ConvertData{

  static List<String> convertObjectListToStringList(List<ListTasks> objectsList){
    List <String> taskListsToConvertToString = [];

    for(int i=0;i<objectsList.length;i++){
      taskListsToConvertToString.add('${objectsList[i].taskTitle};${objectsList[i].isTaskDone}');
    }

    return taskListsToConvertToString;

  }
  static List<ListTasks> convertStringListToObjectList(List<String> stringList){
    List <ListTasks> taskStringToConvertToObject =[];

    for(int i=0;i<stringList.length;i++){
      List taskStatusString = stringList[i].split(';');
      taskStringToConvertToObject.add(ListTasks(taskTitle: taskStatusString[0], isTaskDone: taskStatusString[1]=='true'?true:false));
    }
    return taskStringToConvertToObject;

  }
}