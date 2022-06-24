import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // final uid = FirebaseFirestore.instance
  //     .collection('collection')
  //     .doc(FirebaseAuth.instance.currentUser!.uid);

  Future<String?> getUser({required String field, collection}) async {
    var data1 = (await FirebaseFirestore.instance
            .collection(collection)
            .doc(_auth.currentUser!.uid)
            .get())
        .data()![field]
        .toString();

    return data1;
  }
}
