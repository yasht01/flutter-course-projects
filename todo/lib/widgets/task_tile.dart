import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function toggleCheckbox;
  final int index;
  final Function deleteHandler;

  const TaskTile({
    Key? key,
    required this.task,
    required this.toggleCheckbox,
    required this.index,
    required this.deleteHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CheckboxListTile(
        title: Text(
          task.content,
          style: TextStyle(
            decoration: task.completed == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        value: task.completed,
        onChanged: (value) => toggleCheckbox(task),
      ),
      onLongPress: () => deleteHandler(task),
    );
  }
}
