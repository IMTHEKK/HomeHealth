import 'package:flutter/material.dart';

class MySchedules extends StatefulWidget {
  const MySchedules({Key? key}) : super(key: key);

  @override
  _MySchedulesState createState() => _MySchedulesState();
}

class _MySchedulesState extends State<MySchedules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('My Schedules'),
        ),
      ),
    );
  }
}
