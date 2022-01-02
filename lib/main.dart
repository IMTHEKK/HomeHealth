import 'package:flutter/material.dart';
import 'package:untitled3/screens/splash.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(), // /* EditProfile(),*/ Selection(),
    );
  }
}
