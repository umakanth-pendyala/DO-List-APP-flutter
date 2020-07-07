import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_plans/widgets/task_tile.dart';
import 'package:today_plans/models/task_data.dart';

class Tasks extends StatelessWidget {
  // final List<Task> tasks;
  // Tasks({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      // its always better to provide the data type in angle brackets to make this even more simpler
      //Consumer is just used to make the code typing simpler
      //it converts Provider.of<TaskData>(context) === taskData
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
                nameOfTheTask: taskData.tasks[index].nameOfTheTask,
                isChecked: taskData.tasks[index].taskStatus,
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
