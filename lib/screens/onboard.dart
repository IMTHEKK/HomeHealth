import 'package:flutter/material.dart';
import 'package:untitled3/screens/appointment_list.dart';
import 'package:untitled3/screens/availability_settings.dart';
import 'package:untitled3/screens/doctor_detail.dart';
import 'package:untitled3/screens/home.dart';
import 'package:untitled3/screens/ongoing_treatment.dart';
import 'package:untitled3/screens/profile.dart';
import 'package:untitled3/screens/search.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int _currentIndex = 0;
  List _screens = [
    Home(),
    DoctorDetailScreen(), //Center(child: Text('search')),
    SearchPage(),
    //OnGoingTreatment(),
    //AppointmentList(),
    //AvailabilitySettings(),
    Profile(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
      ),*/
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: _updateIndex,
            selectedItemColor: Colors.blue[700],
            selectedFontSize: 13,
            unselectedFontSize: 13,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                label: "",
                activeIcon: Image.asset(
                  'images/home.png',
                  height: 24,
                  width: 24,
                ),
                icon: Image.asset(
                  'images/home.png',
                  height: 24,
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: Image.asset(
                  'images/appointments.png',
                  height: 24,
                  width: 24,
                ),
                icon: Image.asset(
                  'images/appointments.png',
                  height: 24,
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: Image.asset(
                  'images/chat.png',
                  height: 24,
                  width: 24,
                ),
                icon: Image.asset(
                  'images/chat.png',
                  height: 24,
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: Image.asset(
                  'images/profile.png',
                  height: 24,
                  width: 24,
                ),
                icon: Image.asset(
                  'images/profile.png',
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
