import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
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
  var confirmPasswordController = TextEditingController();
  var addressController = TextEditingController();
  bool isVisible = false;
  DateTime currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  String? dob;

  bool isValid() {
    if (fullNameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your full name");
      return false;
    } else if (!Utils.validateEmail(emailController.text.toString())) {
      Utils.showToast(context, "Please enter valid email");
      return false;
    } else if (phoneController.text.toString().isEmpty ||
        phoneController.text.length > 10) {
      Utils.showToast(context, "Please enter valid phone");
      return false;
    } else if (getDateMonthYear(_selectedDate).toString().isEmpty) {
      Utils.showToast(context, "Please enter valid DOB");
      return false;
    } else if (addressController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter valid Address");
      return false;
    } else if (passwordController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter password");
      return false;
    } else if (confirmPasswordController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter confirm password");
      return false;
    } else if (passwordController.text.toString() !=
        confirmPasswordController.text.toString()) {
      Utils.showToast(context, "Password and confirm password mismatch");
      return false;
    }
    return true;
  }

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: _selectedDate,
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate:
                currentDate) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
        dob = getDateMonthYear(_selectedDate);
      });
    });
  }

  String getDateMonthYear(DateTime selectedStartDate) {
    if (selectedStartDate != null) {
      return DateFormat('yyyy-MM-dd').format(selectedStartDate);
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SingleChildScrollView(
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
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
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
                                    left: MediaQuery.of(context).size.width *
                                        0.22),
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
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
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
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Full Name",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Icon(Icons.person),
                                ),
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Email Address",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Icon(Icons.mail),
                                ),
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Phone Number",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Icon(Icons.phone),
                                ),
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ListTile(
                                  title: Container(
                                    child: Text(
                                      dob == null
                                          ? "Select DOB"
                                          : "${getDateMonthYear(_selectedDate)}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  trailing: GestureDetector(
                                    onTap: _pickDateDialog,
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                        'images/calendar.png',
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ), //Icon(Icons.admin_panel_settings),
                                ),
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                    controller: addressController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Address",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Container(
                                    height: 24,
                                    width: 24,
                                    child: Image.asset(
                                      'images/location.png',
                                      color: Colors.grey,
                                    ),
                                  ), //Icon(Icons.admin_panel_settings),
                                ),
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                    obscureText: true,
                                    decoration: InputDecoration(
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
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                    controller: confirmPasswordController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.grey[800]),
                                        hintText: "Confirm Password",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Container(
                                    height: 24,
                                    width: 24,
                                    child:
                                        Image.asset('images/confirm_pwd.png'),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
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
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: GestureDetector(
                                  onTap: () async {
                                    isVisible = true;
                                    setState(() {});
                                    Map<String, dynamic> params = {
                                      'full-name': fullNameController.text,
                                      'email': emailController.text,
                                      'phone-number': phoneController.text,
                                      'address': addressController.text,
                                      'dob': getDateMonthYear(_selectedDate),
                                      'password': confirmPasswordController.text
                                    };

                                    if (isValid()) {
                                      var res = await commonBloc.hitPostApi(
                                          params, ApiUrl.customer_signup);
                                      if (res['code'] == 200) {
                                        Utils.showToast(
                                            context, '${res['message']}');
                                        Navigator.pop(context);
                                      } else if (res['code'] == 400) {
                                        Utils.showToast(context,
                                            '${res['validation-errors']}');
                                      } else {
                                        Utils.showToast(context,
                                            'User Registration failed');
                                      }
                                    }
                                    isVisible = false;
                                    setState(() {});
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
