import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:tushar_nikam/UI/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin facebookSignIn = new FacebookLogin();
  int count = 0;

  // Check Current User
  _checkUserProfile() async {
    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage("")));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void facebooklogin() async {
    try {
      final FacebookLoginResult result =
          await facebookSignIn.logIn(['email', "public_profile"]);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final AuthCredential credential = FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token);
          final FirebaseUser user =
              (await _auth.signInWithCredential(credential)).user;
          print("User Details");
          print(user.displayName);
          print(user.email);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomePage(user.displayName)));
          break;

        case FacebookLoginStatus.cancelledByUser:
          print("cancelledByUser");
          //Show Snakbar
          final snackBar = SnackBar(content: Text("cancelled By User"));
          Scaffold.of(context).showSnackBar(snackBar);
          break;

        case FacebookLoginStatus.error:
          print("error: ${result.errorMessage}");
          //Show Snakbar
          final snackBar = SnackBar(content: Text("Sorry Some Error Ocuure"));
          Scaffold.of(context).showSnackBar(snackBar);
          break;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _checkUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Sign",
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Sign In With Facebook account",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Color(0xff3b5998),
                  onPressed: () {
                    print("login button press");
                    facebooklogin();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                        height: 46,
                        width: 46,
                        image: AssetImage("images/pic2.png"),
                      ),
                      Text(
                        "Sign In with Facebook",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
