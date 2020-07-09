import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:today_plans/screens/task_screen.dart';

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: (context, connectivity, child) {
        if (connectivity == ConnectivityResult.none) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/images/error.jpg',
                  height: 400.0,
                  width: MediaQuery.of(context).size.width * 1,
                ),
                Text(
                  'page loading time is very slow',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }
        return child;
      },
      child: TasksScreen(),
    );
  }
}

//  return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/error.jpg',
//             height: 400.0,
//             width: MediaQuery.of(context).size.width * 1,
//           ),
//           Text(
//             'Please check your internet connection',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
