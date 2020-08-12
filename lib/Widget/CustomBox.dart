import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String cropName;
  final String cropPrize;
  final String sku;
  CustomBox({this.cropName, this.cropPrize,this.sku});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .05,
      width: size.width * .16,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * .14,
            child: Text(
              cropName,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 10.5,
                color: Colors.black54,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(children: [
                WidgetSpan(
                    child: Text(
                  "₹$cropPrize",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w900,
                  ),
                )),
                WidgetSpan(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(sku,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
