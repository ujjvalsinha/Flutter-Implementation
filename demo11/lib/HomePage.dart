import 'package:demo1/Widget/CustomCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text(
            "Dashboard",
            style: TextStyle(color: Colors.black),
          ),
          leading: new IconButton(
              icon: new Icon(Icons.menu, color: Colors.black),
              onPressed: () => _scaffoldKey.currentState.openDrawer())),
      drawer: new Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                arrowColor: Colors.black,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                accountName: Text("Tushar Nikam"),
                accountEmail: Text("champ96k@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  backgroundImage: NetworkImage("https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",),
                )),
            ListTile(
              title: Text("Dashboard"),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              title: Text("Traking"),
              leading: Icon(Icons.location_on),
            ),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("About us"),
              leading: Icon(Icons.supervised_user_circle),
            ),
            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.perm_contact_calendar),
            ),
            ListTile(
              title: Text("Share"),
              leading: Icon(Icons.share),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.perm_identity),
            ),
            Divider(
              color: Colors.black54,
              height: 1.75,
            ),
            Flexible(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("version 1.15.0.0 "),
              )),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [

          CustomCard(
            color1: Colors.teal,
            color2: Colors.red, 
            image: "images/1.png",
            date: "12 Oct 2020 - 23 Oct 2020", 
            title: "Trips Done", 
            subText1: "200",
            subText2: "52",
            subText3: "25",
            subText4: "563",
            subTextDesc1: "Total Track", 
            subTextDesc2: "Payment",
            subTextDesc3: "Total",
            subTextDesc4: "Loaded",
          ),

           CustomCard(
            color1: Colors.indigo,
            color2: Colors.deepPurple,   
            image: "images/2.png",
            date: "26 Nov 2025 - 22 Dec 2027", 
            title: "Stock Information", 
            subText1: "200",
            subText2: "96",
            subText3: "7892",
            subText4: "25309",
            subTextDesc1: "Total Stock", 
            subTextDesc2: "Done",
            subTextDesc3: "Pending",
            subTextDesc4: "Unloaded",
          ),


           CustomCard(
            color1: Colors.orange,
            color2: Colors.pink,  
            image: "images/3.png",
            date: "15 Jan 2025 - 18 Feb 2022", 
            title: "Trips Status", 
            subText1: "52",
            subText2: "236",
            subText3: "9652",
            subText4: "3022",
            subTextDesc1: "Total Stock", 
            subTextDesc2: "Complted",
            subTextDesc3: "Pending",
            subTextDesc4: "Loaded",
          ),


           CustomCard(
            color1: Colors.amber,
            color2: Colors.indigoAccent,  
            image: "images/4.png",
            date: "12 Oct 2020 - 23 Oct 2020", 
            title: "Payment", 
            subText1: "150",
            subText2: "200",
            subText3: "18000",
            subText4: "25309",
            subTextDesc1: "Total Stock", 
            subTextDesc2: "Complted",
            subTextDesc3: "Pending",
            subTextDesc4: "Loaded",
          ),


           CustomCard(
            color1: Colors.lime,
            color2: Colors.green,   
            image: "images/1.png",
            date: "12 Oct 2020 - 23 Oct 2020", 
            title: "Stock Information", 
            subText1: "200",
            subText2: "200",
           subText3: "18000",
            subText4: "3022",
            subTextDesc1: "Total Stock", 
            subTextDesc2: "Complted",
            subTextDesc3: "Pending",
            subTextDesc4: "Loaded",
          ),


           CustomCard(
            color1: Colors.cyanAccent,
            color2: Colors.deepPurpleAccent,  
            image: "images/2.png",
            date: "52 Nov 2020 - 23 Dec 2020", 
            title: "Stock Kepping units", 
            subText1: "205",
            subText2: "1452",
            subText3: "253",
            subText4: "6930",
            subTextDesc1: "Stock", 
            subTextDesc2: "Incomplted",
            subTextDesc3: "Done",
            subTextDesc4: "Unloaded",
          ), 

        ],
      ),
    ));
  }
}
