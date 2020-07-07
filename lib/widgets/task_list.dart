import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_plans/widgets/task_tile.dart';
import 'package:today_plans/models/task_data.dart';

class Tasks extends StatelessWidget {
  // final List<Task> tasks;
  // Tasks({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
            nameOfTheTask:
                Provider.of<TaskData>(context).tasks[index].nameOfTheTask,
            isChecked: Provider.of<TaskData>(context).tasks[index].taskStatus,
            // onTaskCompleted: (checkBoxState) {
            //   setState(() {
            //     tasks[index].updateTaskStatus();
            //   });
            // }, // pass this method as a prop.
            onTaskCompleted: (checkBoxState) =>
                print('welcome') //onTaskChanged(index),
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
