import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_plans/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  // final Function addAnotherTask;

  // AddTaskScreen({@required this.addAnotherTask});
  final TextEditingController newTaskController = TextEditingController();
  bool validTask = true;

  addAnotherTask(context) {
    if (newTaskController.text.trim().isNotEmpty) {
      Provider.of<TaskData>(context, listen: false)
          .addTask(newTaskController.text);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          color: Color(0xff737373),
          // color: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: newTaskController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    errorText: validTask ? null : 'add a valid task',
                    contentPadding: EdgeInsets.all(0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  color: Colors.lightBlueAccent,
                  onPressed: () => addAnotherTask(context),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget bottomSheetContainer(context) {
//   final TextEditingController newTaskController = TextEditingController();
//   bool validTask = true;

//   Task whenAddButtonClicked() {
//     if (newTaskController.text.trim().isNotEmpty) {
//       return Task(
//         nameOfTheTask: newTaskController.text,
//         taskStatus: false,
//       );
//     }
//   }

//   return SingleChildScrollView(
//     child: Container(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: Container(
//         color: Color(0xff737373),
//         // color: Colors.black,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30.0),
//               topRight: Radius.circular(30.0),
//             ),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Add Task',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.lightBlueAccent,
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextField(
//                 controller: newTaskController,
//                 autofocus: true,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   errorText: validTask ? 'add a valid task' : null,
//                   contentPadding: EdgeInsets.all(0),
//                   border: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.lightBlueAccent,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30.0,
//               ),
//               FlatButton(
//                 padding: EdgeInsets.symmetric(vertical: 10.0),
//                 color: Colors.lightBlueAccent,
//                 onPressed: whenAddButtonClicked,
//                 child: Text(
//                   'Add',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
