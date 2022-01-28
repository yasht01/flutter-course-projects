import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> data;
  final Function toggleCheckbox;
  const TasksList({Key? key, required this.data, required this.toggleCheckbox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskTile(
        task: data[index],
        toggleCheckbox: toggleCheckbox,
        index: index,
      ),
      itemCount: data.length,
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;
  final Function toggleCheckbox;
  final int index;
  const TaskTile(
      {Key? key,
      required this.task,
      required this.toggleCheckbox,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        task.content,
        style: TextStyle(
          decoration: task.completed == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      value: task.completed,
      onChanged: (value) => toggleCheckbox(index, value),
    );
  }
}
