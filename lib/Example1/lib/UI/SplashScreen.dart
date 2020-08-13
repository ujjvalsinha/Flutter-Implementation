import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tushar_nikam/UI/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () { 
      //Navigate to next LoginPage Screen Afetr 4 second
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          )
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image(
                height: 120,
                width: 120,
                image: AssetImage("images/pic1.gif"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                "Dog's Path",
                style: TextStyle(fontSize: 26.0, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                "by",
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                "Virtoustack Softwares Pvt.Ltd.",
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
