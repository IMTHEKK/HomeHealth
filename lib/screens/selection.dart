import 'package:flutter/material.dart';
import 'package:untitled3/screens/login.dart';
import 'package:untitled3/screens/signup.dart';
import 'package:untitled3/screens/signup_therapist.dart';

class Selection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/BG.jpg',
                fit: BoxFit.cover,
              )),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Image(image: AssetImage('images/icon.png'))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                child: Text(
                  'Find a Therapist!',
                  style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Divider(
                  color: Colors.white,
                  thickness: MediaQuery.of(context).size.height * 0.001,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                height: MediaQuery.of(context).size.height * 0.06,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Log in",
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
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                height: MediaQuery.of(context).size.height * 0.06,
                child: GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );*/
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        //title: Text("Alert "),
                        content: Text("Are you a therapist ?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpTherapist(),
                                ),
                              );
                            },
                            child: Text("Yes"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text("No"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
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
            ],
          ),
        ],
      ),
    );
  }
}
