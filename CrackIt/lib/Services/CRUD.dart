import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethod {
  Future<void> addData(blogData) async {
    Firestore.instance.collection("askquestions").add(blogData).catchError((e) => print(e));
  }

  getData() async {
    return await Firestore.instance.collection("askquestions").snapshots();
  }
}
