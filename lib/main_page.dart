import 'package:flutter/material.dart';
import 'package:flutterlayout/pages/camera.dart';
import 'package:flutterlayout/pages/home.dart';
import 'package:flutterlayout/pages/profile.dart';
import 'package:flutterlayout/pages/search.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: PageView(
//        pageSnapping: false,
        onPageChanged: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        controller: _pageController,
        children: <Widget>[Home(), Search(), Camera(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
//            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
//            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text("Camera"),
//            backgroundColor: Colors.amberAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
//            backgroundColor: Colors.orangeAccent,
          ),
        ],
        onTap: (index) {
//          _pageController.animateToPage(
//            index,
//            duration: Duration(milliseconds: 250),
//            curve: Curves.ease,
//          );
        _pageController.jumpToPage(index);
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
