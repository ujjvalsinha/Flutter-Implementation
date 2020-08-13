import 'package:flutter/material.dart';

class QueTab extends StatefulWidget {
  @override
  _QueTabState createState() => _QueTabState();
}

class _QueTabState extends State<QueTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, 
      itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Card(
          child: Text("How do I prepare for GATE 2021 Computer science.? ",
          style: TextStyle(
            fontSize: 16.0, 

          ),
          ),
        ),
      );
     },
    );
  }
}