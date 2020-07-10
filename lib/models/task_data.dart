import 'package:flutter/widgets.dart';
import 'package:today_plans/models/tasks.dart';
import 'package:sqflite/sqflite.dart';
import 'package:today_plans/services/database_helper.dart';

// i used the local database in the phone with SQ lite

class TaskData extends ChangeNotifier {
  TaskData() {
    getDocuments();
  }

  getDocuments() async {
    _tasks = [];
    List<Map<String, dynamic>> rows = await DatabaseHelper.instance.queryAll();
    rows.forEach((element) {
      _tasks.add(Task(
          nameOfTheTask: element[DatabaseHelper.columnTask],
          taskStatus: element[DatabaseHelper.taskStatus] == 1 ? true : false));
    });
    notifyListeners();
  }

  // dynamic userTasks;
  List<Task> _tasks = [
    Task(nameOfTheTask: 'Complete the Tasks app'),
    Task(nameOfTheTask: 'Eat something'),
    Task(nameOfTheTask: 'DO workout'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskName) async {
    _tasks.add(Task(nameOfTheTask: taskName));
    int docuemntId = await DatabaseHelper.instance.insert({
      DatabaseHelper.columnTask: taskName,
      DatabaseHelper.taskStatus: 0,
    });
    notifyListeners();
  }

  Task getSpecificTask(int index) => _tasks[index];

  void updateTask(Task task) async {
    task.updateTaskStatus();
    int numberOfRowsUpdated = await DatabaseHelper.instance.update({
      DatabaseHelper.columnTask: task.nameOfTheTask,
      DatabaseHelper.taskStatus: task.taskStatus ? 1 : 0,
    });
    notifyListeners();
  }

  void deleteSpecificTask(int index) async {
    Task tempTaskVariable = getSpecificTask(index);
    _tasks.removeAt(index);
    int i = await DatabaseHelper.instance.delete(
      tempTaskVariable.nameOfTheTask,
    );
    notifyListeners();
  }
}
