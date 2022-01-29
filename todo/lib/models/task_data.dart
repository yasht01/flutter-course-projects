import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Task> _listData = [
    Task(completed: false, content: "Buy milk"),
    Task(completed: false, content: "Buy eggs"),
    Task(completed: true, content: "Buy bread"),
  ];

  void addTask(String newTaskTitle) {
    _listData.add(Task(completed: false, content: newTaskTitle));
    notifyListeners();
  }

  int get taskCount {
    return _listData.length;
  }

  List<Task> get getTaskList {
    return _listData;
  }

  void toggleCheckbox(Task task) {
    task.toggle();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _listData.remove(task);
    notifyListeners();
  }
}
