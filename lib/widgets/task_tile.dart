import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String nameOfTheTask;
  final bool isChecked;
  final Function onTaskCompleted;
  final Function onLongPressedTile;

  TaskTile({
    @required this.nameOfTheTask,
    @required this.isChecked,
    @required this.onTaskCompleted,
    @required this.onLongPressedTile,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressedTile,
      contentPadding: EdgeInsets.only(left: 0, right: 20.0),
      title: Text(
        nameOfTheTask,
        style: TextStyle(
          decorationThickness: 2.7,
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            value: isChecked,
            onChanged: onTaskCompleted,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onLongPressedTile,
          )
        ],
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
