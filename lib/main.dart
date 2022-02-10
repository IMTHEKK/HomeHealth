import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/network/constant.dart';
import 'package:untitled3/screens/doctor/therapy_completion_form.dart';
import 'package:untitled3/screens/onboard.dart';
import 'package:untitled3/screens/splash.dart';

void main() {
  if (kDebugMode) {
    Constants.setEnvironment(Environment.DEV);
  } else {
    Constants.setEnvironment(Environment.STAGING);
  }
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
        fontFamily: 'poppins',
        primarySwatch: Colors.blue,
      ),
      home: /*TherapyCompletionForm(),*/Splash(), // /* EditProfile(),*/ Selection(),
    );
  }
}
