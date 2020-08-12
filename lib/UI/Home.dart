import 'package:flutter/material.dart';
import 'package:vesatogo/UI/Account.dart';
import 'package:vesatogo/UI/Dashboard.dart';
import 'package:vesatogo/UI/Tracking.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List pages = [
    Dashboard(),
    Tracking(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_selectedIndex] ,   
        bottomNavigationBar: BottomNavigationBar( 

          currentIndex: _selectedIndex,
          onTap:_onItemTapped ,  
          selectedItemColor: Colors.lightGreen,  
          unselectedItemColor: Colors.black54,    
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text("Dashboard")
            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Tracking")
            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), 
              title: Text("Account") 
            ),  
          ],
          
        ),
      ),
    );
  }
}

