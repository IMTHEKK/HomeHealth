import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/screens/onboard.dart';
import 'package:untitled3/screens/selection.dart';
import 'package:untitled3/utilities/shared_preference/get_prefer.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationToLoginPage);
  }

  Future<void> navigationToLoginPage() async {
    await GetPreference().getStringValuesSF('id').then((value) async {
      await GetPreference().getStringValuesSF('name').then((value1) {
        if (value != null &&
            value.toString().trim().isNotEmpty &&
            value1 != null &&
            value1.toString().trim().isNotEmpty)
        {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OnBoard(
                id: value.toString(),
                name: value1.toString(),
              ),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Selection(),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Center(
              child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
          )),
          Center(
              child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
          )),
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                child: Image(
                    /* color: Colors.blue, */
                    image: AssetImage('images/logo.png'))),
          ),
        ],
      ),
    );
  }
}
