import 'package:demo2/Widget/CustomBox.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class BuyersCard extends StatelessWidget {
  final list;
  BuyersCard({@required this.list});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .17,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              width: size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [


                  //time and location reach distance
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 6.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on,
                              size: 14,
                              color: Colors.redAccent,
                            ),
                          ),
                          WidgetSpan(
                            child: Text("21 Km/45 min"),
                          ),
                        ],
                      ),
                    ),
                  ),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      // farms image
                      Center(
                        child: Container(
                          child: CachedNetworkImage(
                             width: size.width * 0.28,
                            imageUrl: list[index].photo,
                          )
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          
                          //Crops name and crops image
                          Row(
                            children: [
                              CachedNetworkImage(
                                  height: size.height * .02,
                                  imageUrl: list[index].cropInfo.photo,
                                ),  
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(list[index].cropInfo.crop),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 2.0,
                          ),

                          //Farm name
                          Text(
                            list[index].buyerName,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.0,
                            ),
                          ),

                          SizedBox(
                            height: 4.0,
                          ),

                          //Rates of crops
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomBox(
                                cropName: list[index].price[0].date,
                                cropPrize: list[index].price[0].price,
                                sku: list[index].price[0].sku,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              CustomBox(
                                cropName: list[index].price[1].date,
                                cropPrize: list[index].price[1].price,
                                sku: list[index].price[1].sku,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              CustomBox(
                                cropName: list[index].price[2].date,
                                cropPrize: list[index].price[2].price,
                                sku: list[index].price[2].sku,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
