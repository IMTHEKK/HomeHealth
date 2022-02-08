import 'package:flutter/material.dart';
import 'package:untitled3/screens/help.dart';
import 'package:untitled3/screens/patient/search1.dart';
import 'package:untitled3/screens/patient/treatment_list_new.dart';
import 'package:untitled3/screens/profile.dart';

class OnBoard extends StatefulWidget {
  final id, name;

  const OnBoard({Key? key, this.id, this.name}) : super(key: key);

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
      //Home(),
      SearchPage1(cId: widget.id, name: widget.name),
      TreatmentList(cId: widget.id),
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
                activeIcon: Icon(
                  Icons.help_outline,
                  size: 24,
                  color: Colors.white,
                ),
                icon: Icon(
                  Icons.help_outline,
                  size: 24,
                  color: Colors.white,
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
