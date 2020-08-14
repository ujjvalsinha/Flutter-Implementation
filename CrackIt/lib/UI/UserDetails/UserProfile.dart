import 'package:crack_it/UI/UserTabScreen/AnswerTab.dart';
import 'package:crack_it/UI/UserTabScreen/QueTab.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffFF906F),
          body: ListView(
            children: <Widget>[
              Container(
                  height: 170,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 18.0,
                              backgroundColor: Colors.white.withOpacity(0.4),
                              child: IconButton(
                                  icon: Icon(Icons.arrow_back,
                                      color: Colors.white, size: 20.0),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Tushar Nikam",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0.75,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 27.0,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(
                                    "Flutter Developer at Banglore",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 36,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 34,
                                backgroundImage: NetworkImage(
                                    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Container(
                  //  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      )),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                          controller: tabController,
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                          tabs: <Widget>[
                            Tab(child: Text("QUESTIONS")),
                            Tab(child: Text("ANSWER")),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 10,
                        child: TabBarView(
                          controller: tabController,
                          children: <Widget>[
                            QueTab(),
                            AnswerTab(),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
            ],
          )
        ),
    );
  }
}
