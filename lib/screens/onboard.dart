import 'package:flutter/material.dart';
import 'package:untitled3/screens/doctor_detail.dart';
import 'package:untitled3/screens/home.dart';
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
    DoctorDetailScreen(),//Center(child: Text('search')),
    SearchPage(),
    Profile(),];

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
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
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
                activeIcon: Icon(Icons.home_outlined,color: Colors.white,),
                icon: Icon(Icons.home_outlined,),
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: Icon(Icons.search,color: Colors.white,),
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: Icon(Icons.grid_view,color: Colors.white,),
                icon: Icon(Icons.grid_view),
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: Icon(Icons.account_circle_outlined,color: Colors.white,),
                icon: Icon(Icons.account_circle_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
