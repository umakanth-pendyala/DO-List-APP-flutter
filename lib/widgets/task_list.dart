import 'package:flutter/material.dart';
import 'package:today_plans/models/tasks.dart';
import 'package:today_plans/widgets/task_tile.dart';

class Tasks extends StatefulWidget {
  const Tasks({
    Key key,
  }) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Task> tasks = [
    Task(nameOfTheTask: 'Complete the Tasks app'),
    Task(nameOfTheTask: 'Eat something'),
    Task(nameOfTheTask: 'DO workout'),
  ];

  onTaskChanged(int index) {
    setState(() {
      tasks[index].updateTaskStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          nameOfTheTask: tasks[index].nameOfTheTask,
          isChecked: tasks[index].taskStatus,
          // onTaskCompleted: (checkBoxState) {
          //   setState(() {
          //     tasks[index].updateTaskStatus();
          //   });
          // }, // pass this method as a prop.
          onTaskCompleted: (checkBoxState) => onTaskChanged(index),
        );
      },
    );
    // return ListView(
    //   padding: EdgeInsets.all(0),
    //   children: <Widget>[
    //     TaskTile(),
    //     TaskTile(),
    //   ],
    // );
  }
}
