import 'package:crack_it/UI/HomeTabScreen/HomePage.dart';
import 'package:crack_it/UI/HomeTabScreen/LikePage.dart';
import 'package:crack_it/UI/HomeTabScreen/MyProfile.dart';
import 'package:crack_it/UI/HomeTabScreen/PostPage.dart';
import 'package:crack_it/UI/HomeTabScreen/Search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> { 
  var array = [
    HomePage(),
    Search(),
    PostPage(),
    LikePage(),
    MyProfile(),
  ];

  int currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: array[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.purple,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, size: 27.0),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 27.0),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 42.0, color: Colors.orange),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 27.0),
            title: Text('Facorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 27.0),
            title: Text('Home'),
          ),
        ],
      ),
    );
  }
}
