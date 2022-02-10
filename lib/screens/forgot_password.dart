import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/verify_otp.dart';
import 'package:untitled3/utilities/utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var emailController = TextEditingController();
  bool isVisible = false;

  bool isValid() {
    if (!Utils.validateEmail(emailController.text.toString())) {
      Utils.showToast(context, "Please enter valid email");
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
                            'Forgot Password',
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
                                    hintText: "Email",
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
                                  "email": emailController.text,
                                };
                                if (isValid()) {
                                  isVisible = true;
                                  setState(() {});
                                  var res = await commonBloc.hitPostApi(params, ApiUrl.forgot_pwd);
                                  if (res['code'] == 200) {
                                    Utils.showToast(context, 'OTP Send Successfully');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VerifyOTP(
                                          otpType: res['data']['otp_type'],
                                          userId: res['data']['user_id'],
                                          userType: res['data']['user_type'],
                                        ),
                                      ),
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
                                        "Send OTP",
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
