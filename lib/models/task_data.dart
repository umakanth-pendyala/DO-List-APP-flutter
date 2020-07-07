import 'package:flutter/widgets.dart';
import 'package:today_plans/models/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(nameOfTheTask: 'Complete the Tasks app'),
    Task(nameOfTheTask: 'Eat something'),
    Task(nameOfTheTask: 'DO workout'),
  ];

  int get taskCount {
    return tasks.length;
  }
}
