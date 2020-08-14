import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String image;
  final String date;
  final String title;
  final String subText1;
  final String subText2;
  final String subText3;
  final String subText4;
  final String subTextDesc1;
  final String subTextDesc2;
  final String subTextDesc3;
  final String subTextDesc4;

  CustomCard(
      {this.color1,
      this.color2,
      this.image,
      this.date,
      this.title,
      this.subText1,
      this.subText2,
      this.subText3,
      this.subText4,
      this.subTextDesc1,
      this.subTextDesc2,
      this.subTextDesc3,
      this.subTextDesc4});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: color1.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(image),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '$date\n\n',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: "$title",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                              color: color2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: color2.withOpacity(0.2), 
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [ 

                  subText1==null ? Container() :RichText( 
                    text: TextSpan(
                      text: "$subText1\n\n",
                       style: TextStyle(
                        color: Colors.black54,    
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: subTextDesc1, 
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14.0, 
                            color: Colors.black54,  
                          ),
                        ),
                      ],
                    ),
                  ),

                   subText2==null ? Container() :RichText(
                    text: TextSpan(
                      text: "$subText2\n\n",
                      style: TextStyle(
                        color: Colors.pink,    
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: subTextDesc2, 
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14.0, 
                             color: Colors.black54, 
                          ),
                        ),
                      ],
                    ),
                  ),


                  subText3==null ? Container() : RichText(
                    text: TextSpan(
                      text: "$subText3\n\n",
                       style: TextStyle(
                        color: Colors.teal,   
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: subTextDesc3, 
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14.0, 
                            color: Colors.black54, 
                          ),
                        ),
                      ],
                    ),
                  ),
 

                  subText4==null ? Container() : RichText(
                    text: TextSpan(
                      text: "$subText4\n\n",
                      style: TextStyle(
                        color: Colors.orange,  
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: subTextDesc4,  
                          style: TextStyle( 
                            fontWeight: FontWeight.w900,
                            fontSize: 14.0, 
                            color: Colors.black54,   
                          ),
                        ),
                      ],
                    ),
                  ),
                   
                ],
              ),
            ) 
          ],
        ),
      ),
    );
  }
}
