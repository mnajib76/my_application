import 'package:flutter/material.dart';
import 'package:todoeyapp/models/list_of_tasks.dart';
import 'package:todoeyapp/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/models/tasks_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
        builder: (context, taskData, child) {
          return ListView.builder(itemBuilder: (context, index) {
            return TaskTile(
                taskTitle: taskData.getTaskTitle(index),
                taskStatus: taskData.getTaskStatus(index),
                checkBoxCallBack: (checkBoxStatus) {
                  taskData.checkBoxStatusChange(index);
                },
                deleteTaskCallBack: (){
                  taskData.deleteTask(taskData.getTaskObject(index));
                },
            );
          },
              itemCount: taskData.taskCount);
        },

    );
  }
}