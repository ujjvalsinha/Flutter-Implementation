import 'package:crack_it/UI/Login/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _signOut() async {
    print("Inside Logout Method");
    await _firebaseAuth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
              child: RaisedButton(
            color: Colors.teal,
            onPressed: () {
              print("Button Press");
              _signOut();
            },
            child: Text("LogOut"),
          )),
        ],
      ),
    ));
  }
}
