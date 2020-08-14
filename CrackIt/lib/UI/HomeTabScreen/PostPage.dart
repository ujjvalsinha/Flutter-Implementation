import 'dart:io';
import 'package:crack_it/Services/CRUD.dart';
import 'package:crack_it/Services/getData.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  TextEditingController queTitle = TextEditingController();
  TextEditingController queDetails = TextEditingController();

  CrudMethod crudMethod = CrudMethod();

  final getData = GetData();

  @override
  void initState() { 
    super.initState();
    var name = getData.userName;
     var imgurl = getData.userProfileUrl;
     print("User Details");
    print(name);  
    print(imgurl);
  }

  File _image;
  Future getImage() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  postData() async {
    var downloadURL;
    try {
      debugPrint("inside postData Method");
      if ((queTitle.text).toString().isNotEmpty &&
          (queDetails.text).toString().isNotEmpty) {
        print("inside if");
        setState(() {
          debugPrint("loadding progress indicator start");
          //_isLoading = true;
        });

        if (_image == null) {
          print("image not selected");
          downloadURL = null;
        } else {
          print("image selected");
          //Upload Image to Firebase Storage
          StorageReference firebaseStorageRef = FirebaseStorage.instance
              .ref()
              .child("postimages")
              .child("${randomAlphaNumeric(9)},jpg");
          final StorageUploadTask task = firebaseStorageRef.putFile(_image);
          downloadURL = await (await task.onComplete).ref.getDownloadURL();
          print("URL = $downloadURL");
        }

        Map<String, String> blogMap = {
          "imageURl": downloadURL,
          "queTitle": queTitle.text,
          "queDetails": queDetails.text,
          // "userName": userName,
          // "userProfile": userProfile,
        };
        crudMethod.addData(blogMap).then((result) {
          // Navigator.pop(context);
          _neverSatisfied();
        });
      } else {
        print("Something Wrong");
        print("question field empty");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Awesome'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Thank you for asking.'),
                Text(
                    'We will distribute your question to writers and notify you about new answers'),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.green,
                height: 42,
                minWidth: 60,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    print("Before");
                    print(queTitle.text);
                    print(queDetails.text);
                    queTitle.clear();
                    queDetails.clear();
                    _image = null;
                    Navigator.of(context).pop();
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 22,
            ),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: _image == null
                    ? Icon(Icons.add_a_photo)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.file(_image, fit: BoxFit.cover)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            TextFormField(
              autofocus: false,
              controller: queTitle,
              decoration: InputDecoration(
                  labelText: "Title",
                  hintText:
                      "Be specific and imagine you’re asking a question to another person",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              maxLength: 100,
              maxLines: 4,
            ),
            SizedBox(
              height: 22,
            ),
            TextFormField(
              autofocus: false,
              controller: queDetails,
              decoration: InputDecoration(
                  labelText: "Body",
                  hintText:
                      "Include all the information someone would need to answer your question",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              maxLength: 250,
              maxLines: 6,
            ),
            MaterialButton(
              color: Colors.redAccent.shade700,
              height: 52,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              onPressed: () {
                postData();
              },
              child: Text(
                "Add Question",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
