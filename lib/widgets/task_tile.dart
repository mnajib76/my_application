import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {

  final String taskTitle;
  final bool taskStatus;
  final Function checkBoxCallBack;
  final Function deleteTaskCallBack;

  TaskTile({this.taskTitle,this.taskStatus,this.checkBoxCallBack,this.deleteTaskCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskTitle,
        style: TextStyle(
            decoration: taskStatus ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: taskStatus,
        onChanged:checkBoxCallBack,
      ),
      onLongPress:deleteTaskCallBack,
    );
  }
}


