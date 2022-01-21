import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/onboard.dart';
import 'package:untitled3/screens/signup.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:http/http.dart' as http;
import 'package:untitled3/utilities/utils.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var pwdController = TextEditingController();

  bool isValid() {
    if (!Utils.validateEmail(emailController.text.toString())) {
      Utils.showToast(context, "Please enter valid email");
      return false;
    } else if (pwdController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your Password");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient:
                      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[Color(0xff8db8e1), Color(0xff1a9cdb)])),
            ),
            Container(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffFAFAFA), //s.white70,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                  bottom: MediaQuery.of(context).size.width * 0.07,
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      //   height: MediaQuery.of(context).size.width * 0.3,
                      child: Image(
                        image: AssetImage(
                          'images/logo.png',
                        ), //color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Card(
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(38), borderSide: BorderSide(color: Colors.transparent)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                          Text(
                            'Login Account',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.blue,
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ListTile(
                              title: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    hintText: "Email or Username",
                                    fillColor: Colors.white70),
                              ),
                              trailing: Icon(Icons.mail),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.blue,
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ListTile(
                              title: TextField(
                                controller: pwdController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    hintText: "Password",
                                    fillColor: Colors.white70),
                              ),
                              trailing:
                                  Container(height: 24, width: 24, child: Image.asset('images/security.png')), //Icon(Icons.admin_panel_settings),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  onChanged: (bool? value) {},
                                  value: true,
                                ),
                                Text('Save Password'),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: GestureDetector(
                              onTap: () async {
                                Map<String, dynamic> params = {"email": emailController.text, "password": pwdController.text};

                                //var res = await commonBloc.hitPostApi( params, ApiUrl.login);
                                if (isValid()) {
                                  var client = http.Client();
                                  var res = await commonBloc.hitPostApi(params, ApiUrl.login);
                                  print('Response body: $res');
                                  if (res.isNotEmpty) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => OnBoard(), //  Profile(),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Login to account",
                                        style: TextStyle(
                                          color: Colors.white,
                                          // fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?'),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) => SignUp(),
                                    ),
                                  );
                                },
                                child: Text(
                                  '\tSign up',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
