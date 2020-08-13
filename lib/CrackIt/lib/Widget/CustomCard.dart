import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            color: Colors.purpleAccent,
            elevation: 6.0,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              alignment: Alignment.center,
              width: 140.0, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), 
                child: Text(
                  "Computer Engineering",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0, 
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
