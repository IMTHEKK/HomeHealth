import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/utilities/utils.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var dobController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

  bool isValid() {
    if (fullNameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your full name");
      return false;
    } else if (Utils.validateEmail(emailController.text.toString()) == null) {
      Utils.showToast(context, "Please enter valid email");
      return false;
    } else if (phoneController.text.toString().isEmpty ||
        phoneController.text.length > 10) {
      Utils.showToast(context, "Please enter valid phone");
      return false;
    } else if (dobController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter valid DOB");
      return false;
    } else if (passwordController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter password");
      return false;
    } else if (confirmpasswordController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter confirm password");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.36,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.025,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.22),
                            // alignment: Alignment.center,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.055,
                      left: MediaQuery.of(context).size.width * 0.07,
                      right: MediaQuery.of(context).size.width * 0.07,
                      bottom: MediaQuery.of(context).size.width * 0.07,
                    ),
                    child: Card(
                      elevation: 10,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38),
                          borderSide: BorderSide(color: Colors.transparent)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
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
                                controller: fullNameController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Full Name",
                                    fillColor: Colors.white70),
                              ),
                              trailing: Icon(Icons.person),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
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
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Email Address",
                                    fillColor: Colors.white70),
                              ),
                              trailing: Icon(Icons.mail),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
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
                                controller: phoneController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Phone Number",
                                    fillColor: Colors.white70),
                              ),
                              trailing: Icon(Icons.phone),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
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
                                controller: dobController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Date of Birth",
                                    fillColor: Colors.white70),
                              ),
                              trailing: Container(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'images/calendar.png',
                                  color: Colors.grey,
                                ),
                              ), //Icon(Icons.admin_panel_settings),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
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
                                controller: passwordController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Password",
                                    fillColor: Colors.white70),
                              ),
                              trailing: Container(
                                height: 24,
                                width: 24,
                                child: Image.asset('images/security.png'),
                              ),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
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
                                controller: confirmpasswordController,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    /*  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),*/
                                    //filled: true,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Confirm Password",
                                    fillColor: Colors.white70),
                              ),
                              trailing: Container(
                                height: 24,
                                width: 24,
                                child: Image.asset('images/confirm_pwd.png'),
                              ),
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
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
                                Text('Agree with'),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Term & Conditions',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: GestureDetector(
                              onTap: () {
                                //createAccount();
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
                                        "Create account",
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
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?'),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  '\tLogin',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createAccount() {
    if (isValid()) {

    }
  }
}
