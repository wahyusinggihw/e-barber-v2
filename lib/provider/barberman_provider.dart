import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModelRambut with ChangeNotifier {
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('jenispotongans');

  Future<void> createOrUpdate(
      String namaPotongan, String hargaPotongan, String photoUrl,
      [DocumentSnapshot? documentSnapshot]) async {
    notifyListeners();
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      photoUrl = documentSnapshot['photo_url'];
      namaPotongan = documentSnapshot['nama_potongan'];
      hargaPotongan = documentSnapshot['harga'].toString();
    }
  }
}
