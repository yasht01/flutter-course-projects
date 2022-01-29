class Task {
  String content;
  bool completed;

  Task({required this.completed, required this.content});

  void toggle() {
    completed = !completed;
  }
}
