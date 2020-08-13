import 'package:cached_network_image/cached_network_image.dart';
import 'package:crack_it/Services/CRUD.dart';
import 'package:crack_it/UI/UserDetails/UserProfile.dart';
import 'package:crack_it/Widget/DescriptionTextWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream blogStream;
  CrudMethod crudMethod = CrudMethod();

  @override
  void initState() {
    debugPrint("Inside Init Method");
    super.initState();
    crudMethod.getData().then((result) {
      blogStream = result;
      debugPrint("getData Method call");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: blogStream == null
            ? Container(
                alignment: Alignment.center,
                child: Text("Loading..."),
              )
            : StreamBuilder(
                stream: blogStream,
                builder: (context, snapshot) {
                  return Container(
                    //This Container Takes whole Screen
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          elevation: 0.75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                leading: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserProfile()));
                                  },
                                  child: CircleAvatar(
                                      //  backgroundImage: NetworkImage(userProfileImage[index]),
                                      ),
                                ),
                                title: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserProfile()));
                                  },
                                  child: Text("userNmae[index]"),
                                ),
                                subtitle: Text("userRoll[index]"),
                                trailing: Icon(Icons.person_add,
                                    color: Colors.blueAccent),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  snapshot
                                      .data.documents[index].data['queTitle'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              snapshot.data.documents[index].data['imageURl'] ==
                                      null
                                  ? Text(" ")
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 10.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot
                                              .data
                                              .documents[index]
                                              .data['imageURl'],
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    child: DescriptionTextWidget(
                                      text: snapshot.data.documents[index]
                                          .data['queDetails'],
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 70.0,
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(Icons.comment,
                                                  size: 18.0),
                                              onPressed: () {}),
                                          Text(
                                            "106",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 70.0,
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(Icons.favorite_border,
                                                  size: 18.0),
                                              onPressed: () {}),
                                          Text(
                                            "625",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 70.0,
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                              icon:
                                                  Icon(Icons.share, size: 18.0),
                                              onPressed: () {}),
                                          Text(
                                            "106",
                                            style: TextStyle(
                                              fontSize: 13.0,
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
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
