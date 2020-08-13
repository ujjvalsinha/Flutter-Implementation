import 'package:crack_it/Widget/categoriesCard.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 32.0,
          ),

          Categories("Computer Engineering",
              "https://analyticsindiamag.com/wp-content/uploads/2018/12/anninR.jpg"),

          Categories("IT Engineering",
              "https://content-static.upwork.com/blog/uploads/sites/3/2018/07/26091214/Cost-to-Hire-a-Network-Engineer-feature.jpg"),

          Categories("Mechanical Engineering",
              "https://res.cloudinary.com/highereducation/image/upload/f_auto,fl_lossy,q_auto,c_fill,h_400,w_800/v1566232749/BestColleges.com/BC-Career-Mechanical_engineering_eph5th.jpg"),

          Categories("Civil Engineering",
              "https://img-a.udemycdn.com/course/750x422/1998380_30ae.jpg"),

          Categories("Electrical Engineering",
              "https://electrical-engineering-portal.com/wp-content/uploads/2019/02/start-design-electrical-installation-1.jpg"),

          Categories("E & TC Engineering",
              "https://d1wec191nf9ffm.cloudfront.net/sites/default/files/styles/blogfeature_large/public/field/image/elecrtrical-engineer-michigan-tech.jpg?itok=LpJiS_75"),

          Categories("Chemical Engineering",
              "https://www.bls.gov/ooh/images/15053.jpg"),

          // Categories("Auronatical Engineering","https://static.kent.ac.uk/nexus/ems/50.jpg"),
        ],
      ),
    ));
  }
}
