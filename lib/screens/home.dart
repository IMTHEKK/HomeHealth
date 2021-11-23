import 'package:flutter/material.dart';
import 'package:untitled3/screens/edit_profile.dart';
import 'package:untitled3/screens/profile.dart';
import 'package:untitled3/screens/signup.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List _screens = [SignUp(), EditProfile(), SignUp(), Profile()];

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
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
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
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Icon(Icons.search),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Icon(Icons.grid_view),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                ],
              ),
            )));
  }
}
