import 'package:flutter/material.dart';
import 'package:transactional_sms/Screen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Transactional SMS",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}