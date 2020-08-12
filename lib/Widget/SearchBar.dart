import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.062,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Expanded(
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                textAlign: TextAlign.center,
                autocorrect: true,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  //TODOD
                },
                decoration: InputDecoration(
                  hintText: "Search Specifc Crop",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey.withOpacity(0.9),
                ),
                onPressed: (){
                  //TODO
                }),
          ],
        ),
      ),
    );
  }
}
