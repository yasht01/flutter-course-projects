import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) => ListView.builder(
        itemBuilder: (context, index) => TaskTile(
          task: value.getTaskList[index],
          toggleCheckbox: value.toggleCheckbox,
          index: index,
          deleteHandler: value.deleteTask,
        ),
        itemCount: value.taskCount,
      ),
    );
  }
}
