import 'package:crack_it/UI/Login/SignUp.dart'; 
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Let's Crack it",
    theme: ThemeData.dark(), 
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}
