import 'package:flutter/material.dart';

class MyTherapies extends StatefulWidget {
  const MyTherapies({Key? key}) : super(key: key);

  @override
  _MyTherapiesState createState() => _MyTherapiesState();
}

class _MyTherapiesState extends State<MyTherapies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('My Therapies'),
        ),
      ),
    );
  }
}
