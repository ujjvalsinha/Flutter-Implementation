import 'package:crack_it/Services/getData.dart';
import 'package:crack_it/UI/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final getData = GetData();
  bool isLoading = false;

  

  _checkUserProfile() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      print("inside check method");
      FirebaseUser user = await _auth.currentUser();
      print("User = $user");
      if (user != null) {
        print(user);
        print("user is already login");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print("User not Login");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    print("inside init Method");
    super.initState();
    _checkUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff3cba54),
                        Color(0xfff4c20d),
                        Color(0xffdb3236),
                        Color(0xff4885ed),
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    elevation: 3.0,
                    splashColor: Colors.deepPurple,
                    onPressed: () {
                      print("Connect with googel button press");
                      setState(() {
                        isLoading = true;
                      });
                      getData.handleSignIn().then((FirebaseUser user) {
                        if (user.isEmailVerified) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      });
                    },
                    child: isLoading == true
                        ? Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator())
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Image(
                                    height: 42,
                                    image: NetworkImage(
                                        "http://pngimg.com/uploads/google/google_PNG19635.png")),
                              ),
                              Text(
                                "Connect with Google",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
