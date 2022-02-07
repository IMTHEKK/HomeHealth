import 'package:flutter/material.dart';
import 'package:untitled3/screens/doctor/my_reviews.dart';
import 'package:untitled3/screens/doctor/my_schedules.dart';
import 'package:untitled3/screens/doctor/my_therapies.dart';
import 'package:untitled3/screens/doctor/profile.dart';

class Home extends StatefulWidget {
  final id, name;

  const Home({Key? key, this.id, this.name}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/doctor/welcome.png',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    )),
                Text(
                  'JOHN SMITH'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              id: widget.id,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 50, width: 50, child: Image.asset('images/doctor/box_shape.png')),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/doctor/user.png',
                                    height: 36,
                                    width: 36,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                                  Text(
                                    'My\nAccount',
                                    style: TextStyle(
                                      color: Color(0xff0095da),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyTherapies(id: widget.id,),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 50, width: 50, child: Image.asset('images/doctor/box_shape.png')),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/doctor/meditation.png',
                                    height: 36,
                                    width: 36,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                                  Text(
                                    'My\nTherapies',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff0095da),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MySchedules(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 50, width: 50, child: Image.asset('images/doctor/box_shape.png')),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/doctor/calendar.png',
                                    height: 36,
                                    width: 36,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                                  Text(
                                    'My\nSchedule',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff0095da),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyReviews(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 50, width: 50, child: Image.asset('images/doctor/box_shape.png')),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/doctor/rating.png',
                                    height: 36,
                                    width: 36,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                                  Text(
                                    'My\nReviews',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff0095da),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
