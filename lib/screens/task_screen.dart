import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:today_plans/models/task_data.dart';
import 'package:today_plans/models/tasks.dart';
import 'package:today_plans/screens/bottom_screen.dart';
import 'package:today_plans/widgets/task_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  // const TaskScreen({Key key}) : super(key: key);
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool checkBoxValue = false;

  // addAnotherTask(Task newTask) {
  //   setState(() {
  //     tasks.add(newTask);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlueAccent,
        systemNavigationBarColor: Colors.black,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 100.0,
              left: 30.0,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 40.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Plans ?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 50.0,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 30.0, left: 30.0, right: 30, bottom: 50.0,
                // bottom: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Tasks(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              addAnotherTask: (String newTaskTitle) {
                // setState(() {
                //   tasks.add(Task(nameOfTheTask: newTaskTitle));
                // });
                Navigator.pop(context); // it will pop the bottom screen
              },
            ),
            isScrollControlled: true,
          );
        },
        child: Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
