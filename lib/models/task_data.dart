import 'package:flutter/widgets.dart';
import 'package:today_plans/models/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(nameOfTheTask: 'Complete the Tasks app'),
    Task(nameOfTheTask: 'Eat something'),
    Task(nameOfTheTask: 'DO workout'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskName) {
    _tasks.add(Task(nameOfTheTask: taskName));
    notifyListeners();
  }

  Task getSpecificTask(int index) => _tasks[index];

  void updateTask(Task task) {
    task.updateTaskStatus();
    notifyListeners();
  }

  void deleteSpecificTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
