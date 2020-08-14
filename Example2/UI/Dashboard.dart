import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vesatogo/Model/BuyersData.dart';
import 'package:vesatogo/Model/CropsData.dart';
import 'package:vesatogo/Widget/BuyersCard.dart';
import 'package:vesatogo/Widget/Crops.dart';
import 'package:http/http.dart' as http;
import 'package:vesatogo/Data/Data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<CropData> cropsModel = new List();
  List<Buyers> list = List();

  _fetchData() async {
    final response = await http.get(url1);
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Buyers.fromJson(data))
          .toList();
      setState(() {});
    } else {
      throw Exception('Failed to load photos');
    }
  }

  getCropsData() async {
    try {
      final response = await http.get(url);
      List<dynamic> jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        //print(element);
        CropData cropModels = new CropData();
        cropModels = CropData.fromMap(element);
        cropsModel.add(cropModels);
        setState(() {});
      });
    } catch (e) {
      print(e.toString());
    }
  }


  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
    getCropsData();
  }

 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: cropsModel.isEmpty && list.isEmpty
          ? Center(
              child: SpinKitFadingFour(
              color: Colors.green,
            ))
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .04,
                      ),

                      // What is Your Crops? text
                      Container(
                        width: size.width,
                        child: Text(
                          "What is your crop?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20.0,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height * .02,
                      ),

                      //Search bar

                     
                      Container(
                        height: size.height * 0.062,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),     
                          child: TextFormField(
                            controller: myController,
                            decoration: InputDecoration(
                              border: InputBorder.none, 
                              hintText: "Search",
                            ),
                            onChanged: (value) {
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height * .02,
                      ),

                      // Load all Crops
                      Crops(
                        cropsModel: cropsModel,
                      ),

                      SizedBox(
                        height: size.height * .02,
                      ),

                      //Buyers Text
                      Container(
                        alignment: Alignment.centerLeft,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Buyer",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),

                      // Buyer card details
                      BuyersCard(
                        list: list,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
