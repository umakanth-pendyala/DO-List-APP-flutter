import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_plans/models/task_data.dart';
import 'package:today_plans/screens/connectivity_screen.dart';
import 'package:today_plans/screens/task_screen.dart';
import 'package:today_plans/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: Connect(),
      ),
    );
  }
}
