import 'package:flutter/material.dart';

class AddTaskModal extends StatelessWidget {
  final _textFieldController = TextEditingController();
  final Function addTask;

  AddTaskModal({Key? key, required this.addTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: _textFieldController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                primary: Colors.white,
              ),
              onPressed: () {
                addTask(_textFieldController.text);
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
