import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/models/tasks_data.dart';

class AddNewTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTask;
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30,top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value){
              newTask = value;
            },
          ),
          FlatButton(
            child: Text('Add',style: TextStyle(color: Colors.white),),
            color: Colors.lightBlueAccent,
            onPressed: (){
              Provider.of<TasksData>(context,listen: false).addNewTask(newTask);
              Navigator.pop(context);
            }
          ),
        ],
      ),
    );
  }
}
