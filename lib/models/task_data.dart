import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:today_plans/models/tasks.dart';

class TaskData extends ChangeNotifier {
  dynamic userTasks;

  TaskData() {
    userTasks = Firestore.instance.collection('tasks');
    getDocuments();
  }

  getDocuments() async {
    _tasks = [];
    QuerySnapshot snapshot = await userTasks.getDocuments();
    snapshot.documents.forEach((element) {
      print(element.data['taskName']);
      _tasks.add(Task(nameOfTheTask: element.data['taskName']));
    });
    notifyListeners();
  }

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
    notifyListeners();
    await userTasks.add({'taskName': taskName, 'taskCompleted': false});
  }

  Task getSpecificTask(int index) => _tasks[index];

  void updateTask(Task task) async {
    task.updateTaskStatus();
    notifyListeners();
    final QuerySnapshot snapshot = await userTasks
        .limit(1)
        .where('taskName', isEqualTo: task.nameOfTheTask)
        .getDocuments();
    DocumentSnapshot doc = snapshot.documents[0];
    if (doc.exists) {
      doc.reference.updateData(
        {
          'taskName': task.nameOfTheTask,
          'taskCompleted': task.taskStatus,
        },
      );
    }
  }

  void deleteSpecificTask(int index) async {
    String taskName = _tasks[index].nameOfTheTask;
    _tasks.removeAt(index);
    notifyListeners();
    final QuerySnapshot snapshot = await userTasks
        .limit(1)
        .where('taskName', isEqualTo: taskName)
        .getDocuments();
    DocumentSnapshot doc = snapshot.documents[0];
    if (doc.exists) {
      doc.reference.delete();
    }
  }
}
