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

class FormData {
  late String id = "id",
      namaDepan = "Nama Depan",
      namaBelakang = "Nama Belakang",
      email = "Email",
      password = "Password",
      confirmPassword = "Konfirmasi Password",
      role = '';
}

class UserRole {
  late String role = '';
}

class SimpanData {
  static late String id,
      namaDepan,
      namaBelakang,
      email,
      password,
      confirmPassword,
      role;
}

class simpanDataPotongan {
  static late String photoUrl, nama, harga;
}

class simpanDataPotongan2 {
  static late String photoUrl, nama, harga;
}

class authValidation {
  static late String role = '', action = '';
}

class simpanTimeStamp {
  static late String time = '';
}

class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}
