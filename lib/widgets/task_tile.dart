import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String nameOfTheTask;
  final bool isChecked;
  final Function onTaskCompleted;

  TaskTile({
    @required this.nameOfTheTask,
    @required this.isChecked,
    @required this.onTaskCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 20.0),
      title: Text(
        nameOfTheTask,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: onTaskCompleted,
      ),
    );
  }
}

// just like how we access the variables of parent widget we can access the methods which controls
// the state in them.

// ---------------------- extra widgets -------------------- use if necessary

// class TaskTile extends StatefulWidget {
//   final String nameOfTheTask;

//   TaskTile({@required this.nameOfTheTask});

//   @override
//   _TaskTileState createState() => _TaskTileState();
// }

// class _TaskTileState extends State<TaskTile> {
//   bool isChecked = false;

//   checkBoxCallBack(bool updatedCheckBoxValue) {
//     setState(() {
//       isChecked = updatedCheckBoxValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.only(left: 0, right: 20.0),
//       title: Text(
//         widget.nameOfTheTask.trim(),
//         style: TextStyle(
//           decoration: isChecked ? TextDecoration.lineThrough : null,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       trailing: TaskCheckBox(
//         checkBoxIsChecked: isChecked,
//         checkBoxCallBack: checkBoxCallBack,
//       ),
//     );
//   }
// }

// class TaskCheckBox extends StatelessWidget {
//   final checkBoxIsChecked;
//   final Function checkBoxCallBack;

//   TaskCheckBox(
//       {@required this.checkBoxIsChecked, @required this.checkBoxCallBack});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(value: checkBoxIsChecked, onChanged: checkBoxCallBack);
//   }
// }
