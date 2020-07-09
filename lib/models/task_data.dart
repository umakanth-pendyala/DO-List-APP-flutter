import 'package:flutter/widgets.dart';
import 'package:today_plans/models/tasks.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

// i used the local database in the phone with SQ lite

class TaskData extends ChangeNotifier {
  static Database _db;
  static const todoTable = 'todo';
  static const id = 'id';
  static const name = 'name';
  TaskData() {}

  // dynamic userTasks;
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

  void deleteSpecificTask(int index) async {
    _tasks.removeAt(index);
    notifyListeners();
  }

  Future<void> createTable(Database db) async {
    final todoSql = '''CREATE TABLE $todoTable
    (
      'nameOfTheTask' TEXT,
      'isCompleted' BIT NOT NULL
    )''';
    await db.execute(todoSql);
  }

  Future<String> getDatabasePath(String dataBaseName) async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, dataBaseName);

    if (await Directory(dirname(path)).exists()) {
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDataBase() async {
    final path = await getDatabasePath('todo_db');
    _db = await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    await createTable(db);
  }
}
