import 'package:flutter/material.dart';
import 'package:today_plans/models/tasks.dart';
import 'package:today_plans/widgets/task_tile.dart';

class Tasks extends StatefulWidget {
  final List<Task> tasks;
  Tasks({@required this.tasks});

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  onTaskChanged(int index) {
    setState(() {
      widget.tasks[index].updateTaskStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          nameOfTheTask: widget.tasks[index].nameOfTheTask,
          isChecked: widget.tasks[index].taskStatus,
          // onTaskCompleted: (checkBoxState) {
          //   setState(() {
          //     tasks[index].updateTaskStatus();
          //   });
          // }, // pass this method as a prop.
          onTaskCompleted: (checkBoxState) => onTaskChanged(index),
        );
      },
    );
  }
}

// return ListView(
//   padding: EdgeInsets.all(0),
//   children: <Widget>[
//     TaskTile(),
//     TaskTile(),
//   ],
// );
