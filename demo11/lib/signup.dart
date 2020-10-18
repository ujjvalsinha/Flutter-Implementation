import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  String email = "";
  String password = "123";
  Color col;
  final emailobj = TextEditingController();
  final passwordobj = TextEditingController();
  succesful() {}
  var a;
  var response;
  var convertdata;
  

  //Userid is admin
  //password is 123

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/paper.jpeg"), fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset("images/LOGO.png"),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 7, 25, 15),
                child: TextField(
                  controller: emailobj,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email ID",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 7, 25, 15),
                child: TextField(
                  controller: passwordobj,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 20, 25, 15),
                child: MaterialButton(
                    color: Colors.red[900],
                    height: 50,
                    minWidth: 200,
                    splashColor: Colors.green,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      
                    }),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 25, color: col),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
