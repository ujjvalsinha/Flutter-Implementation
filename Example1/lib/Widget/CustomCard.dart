import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final data, index, subIndex, subIndexLength;
  CustomCard(this.data, this.index, this.subIndex, this.subIndexLength);
  @override
  _CustomCardState createState() => _CustomCardState(
      this.data, this.index, this.subIndex, this.subIndexLength);
}

class _CustomCardState extends State<CustomCard> {
  var data, index, subIndex, subIndexLength;
  _CustomCardState(this.data, this.index, this.subIndex, this.subIndexLength);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image(
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: data[index]['sub_paths'][subIndex]['image'] == null
                    ? NetworkImage("https://bitsofco.de/content/images/2018/12/broken-1.png")
                    : NetworkImage("${data[index]['sub_paths'][subIndex]['image']}")),
          ],
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.black,
          width: MediaQuery.of(context).size.width, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text("${data[index]['sub_paths'][subIndex]['title']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16.0,
                    )),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    try {
                      print("Hello");
                      print(subIndex);
                      setState(() {
                        if (subIndex < subIndexLength - 1) {
                          subIndex++;
                          print(subIndex);
                        } else {
                          subIndex=0;
                          print(subIndex);
                        }
                      });
                    } catch (e) {
                      print(e.toString());
                    } 
                  }
              )
            ],
          ),
        ),
      ],
    );
  }
}
