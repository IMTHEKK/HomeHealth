import 'package:flutter/material.dart';
import 'package:untitled3/screens/availability_settings.dart';
import 'package:untitled3/screens/help.dart';
import 'package:untitled3/screens/home.dart';
import 'package:untitled3/screens/ongoing_treatment.dart';
import 'package:untitled3/screens/ongoing_treatment_list.dart';
import 'package:untitled3/screens/profile.dart';
import 'package:untitled3/screens/search.dart';
import 'package:untitled3/screens/search1.dart';
import 'package:untitled3/screens/testimonials_list.dart';

class OnBoard extends StatefulWidget {
  final id;

  const OnBoard({Key? key, this.id}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int _currentIndex = 0;

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List _screens = [
      //Home(id: widget.id),
      //DoctorDetailScreen(),
      SearchPage1(cId: widget.id),
      //Text('search'),
      TestimonialsList(cId: widget.id),
      // OngoingTreatmentList(),
      //AppointmentList(),
      //AvailabilitySettings(),
      HelpScreen(),
      Profile(id: widget.id),
    ];
    return Scaffold(
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
