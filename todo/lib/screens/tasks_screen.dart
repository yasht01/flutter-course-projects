import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/add_task_modal.dart';
import 'package:todo/widgets/tasks_list.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Task> _data = [
    Task(completed: false, content: "Buy milk"),
    Task(completed: false, content: "Buy eggs"),
    Task(completed: true, content: "Buy bread"),
  ];

  void addTask(String taskTitle) {
    setState(() {
      _data.add(Task(completed: false, content: taskTitle));
    });
  }

  void toggleCheckbox(int index, bool? newValue) {
    return setState(() {
      _data[index].completed = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: MaterialButton(
        padding: const EdgeInsets.all(20.0),
        color: Colors.lightBlueAccent,
        elevation: 4.0,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => AddTaskModal(
              addTask: addTask,
            ),
            isScrollControlled: true,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.format_list_bulleted_outlined,
                      color: Colors.lightBlueAccent,
                      size: 40,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  '12 Tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(
                data: _data,
                toggleCheckbox: toggleCheckbox,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
