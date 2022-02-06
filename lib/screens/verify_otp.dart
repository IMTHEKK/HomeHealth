import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/login.dart';
import 'package:untitled3/screens/selection.dart';
import 'package:untitled3/utilities/utils.dart';

class VerifyOTP extends StatefulWidget {
  final userId, userType, otpType;

  const VerifyOTP({Key? key, this.userId, this.userType, this.otpType}) : super(key: key);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  var otpController = TextEditingController();
  bool isVisible = false;

  bool isValid() {
    if (otpController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter valid otp');
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
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xff8db8e1), Color(0xff1a9cdb)])),
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
                  top: MediaQuery.of(context).size.height * 0.1,
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
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38), borderSide: BorderSide(color: Colors.transparent)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                          Text(
                            'Verify OTP Screen',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
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
                                controller: otpController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    hintText: 'OTP',
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
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: GestureDetector(
                              onTap: () async {
                                Map<String, dynamic> params = {
                                  'otp': otpController.text.toString(),
                                  'user_id': widget.userId.toString(),
                                  'user_type': widget.userType.toString(),
                                  'otp_type': widget.otpType.toString(),
                                };
                                if (isValid()) {
                                  isVisible = true;
                                  setState(() {});
                                  var res = await commonBloc.hitPostApi(params, ApiUrl.verify_otp);
                                  if (res['code'] == 200) {
                                    Utils.showToast(context, 'OTP Verified Successfully');
                                    Navigator.push(context, MaterialPageRoute(builder: (builder) => UpdatePassword()));
                                  } else {
                                    Utils.showToast(context, 'Error: ${res['validation-errors']['wrong-credentials']}');
                                  }
                                  isVisible = false;
                                  setState(() {});
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
                                        'Verify',
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
                  top: MediaQuery.of(context).size.height * 0.07,
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpdatePassword extends StatefulWidget {
  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible = false;

  bool isValid() {
    if (!Utils.validateEmail(emailController.text.toString())) {
      Utils.showToast(context, 'Please enter valid email');
      return false;
    } else if (passwordController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter valid password');
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
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xff8db8e1), Color(0xff1a9cdb)])),
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
                  top: MediaQuery.of(context).size.height * 0.1,
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
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38), borderSide: BorderSide(color: Colors.transparent)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                          Text(
                            'Reset Password Screen',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
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
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    hintText: 'Email',
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
                                obscureText: true,
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    hintText: 'Password',
                                    fillColor: Colors.white70),
                              ),
                              trailing: Icon(Icons.security),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
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
                                Map<String, dynamic> params = {
                                  'email': emailController.text,
                                  'password': passwordController.text,
                                };
                                if (isValid()) {
                                  isVisible = true;
                                  setState(() {});
                                  var res = await commonBloc.hitPostApi(params, ApiUrl.forgot_pwd);
                                  if (res['code'] == 200) {
                                    Utils.showToast(context, 'Password created Successfully');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Selection(),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    Utils.showToast(context, 'Error: ${res['validation-errors']['wrong-credentials']}');
                                  }
                                  isVisible = false;
                                  setState(() {});
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
                                        'Create Password',
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
                  top: MediaQuery.of(context).size.height * 0.07,
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
