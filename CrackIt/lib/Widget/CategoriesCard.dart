import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories(this.catName, this.image);

  final catName, image;

  @override
  _CategoriesState createState() => _CategoriesState(this.catName, this.image);
}

class _CategoriesState extends State<Categories> {
  _CategoriesState(this.catName, this.image);

  final catName, image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(6.0),
          height: 78,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(6.0),
          height: 78,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.black54,
          ),
          child: Text(
            catName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
