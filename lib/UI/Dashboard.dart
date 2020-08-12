import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vesatogo/Data/Data.dart';
import 'package:vesatogo/Model/CropsData.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  CropsData cropsData = CropsData();

  getCropsData() async {
    try {
       var responce = await http.get(url);
     // List<dynamic> jsonData = jsonDecode(responce.body);
     var result = responce.body;
      print("****************************");
      var data = CropsData.fromJson(json.decode(result));

      print(data);


    } catch (e) {
      print(e.toString());
    }
  }

 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .02,
                ),

                // What is Your Crops? text
                Container(
                  width: size.width,
                  child: Text(
                    "What is Your Crops?",
                    textAlign: TextAlign.start,
                  ),
                ),

                SizedBox(
                  height: size.height * .02,
                ),

                //Search bar
                Container(
                  height: size.height * 0.062,
                  width: size.width,
                  color: Colors.purple,
                ),

                SizedBox(
                  height: size.height * .02,
                ),

                RaisedButton(
                  onPressed: () {
                    getCropsData();
                  },
                  child: Text("Get Data"),
                ),


                 RaisedButton(
                  onPressed: () {
                    setState(() {
                     print("${cropsData.buyerName}");
                    });
                  },
                  child: Text("Get Data"),
                )

                // Load all Crops

                // Buyer Menu
              ],
            ),
          ),
        ),
      ),
    );
  }
}
