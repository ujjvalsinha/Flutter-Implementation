import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tushar_nikam/UI/LoginPage.dart';
import 'dart:convert';
import 'package:tushar_nikam/Widget/CustomCard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  final name;
  HomePage(this.name);
  @override
  _HomePageState createState() => _HomePageState(this.name);
}

class _HomePageState extends State<HomePage> {
  var name;
  _HomePageState(this.name);

  // Logout Button
  void _logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  var data, url = "https://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths";

  getData(var url) async {
    try {
      var responce = await http.get(Uri.encodeFull(url));
      setState(() {
        var convertData = json.decode(responce.body);
        data = convertData;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    if (name != "") {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
            title: new Text("Alert"),
            content: new Text("Signed in as $name"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      });
    }

    getData(url);
  }

  Future<bool> _backButtonPress() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do You really Want to exit ?"),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("No")),
          FlatButton(
              onPressed: () {
                exit(0);
              },
              child: Text("Yes"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backButtonPress,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Dog's Path",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              //logout Button
              IconButton(
                  icon: Icon(Icons.person_outline),
                  onPressed: () {
                    _logout();
                  }
               )
            ],
          ),
          body: data == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  // n-1 for the API last element are differnt key: value
                  itemCount: data.length - 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(data[index]['title']),
                            subtitle: Text(
                                "${data[index]['sub_paths'].length} Sub Paths"),
                            trailing: RaisedButton(
                              onPressed: () {},
                              color: Colors.black54,
                              child: Text(
                                "Open Path",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            )),
                        Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: data[index]['sub_paths'].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, subIndex) {
                                  var subIndexLength =
                                      data[index]['sub_paths'].length;
                                  return CustomCard(
                                      data, index, subIndex, subIndexLength);
                                })),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
