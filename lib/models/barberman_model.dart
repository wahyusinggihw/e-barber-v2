import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RambutModel {
  final CollectionReference productss =
      FirebaseFirestore.instance.collection('jenispotongan');

  Future<void> createOrUpdate(
      String namaPotongan, String hargaPotongan, String photoUrl,
      [DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      photoUrl = documentSnapshot['photo_url'];
      namaPotongan = documentSnapshot['nama_potongan'];
      hargaPotongan = documentSnapshot['harga'].toString();
    }
  }

  // Future<void> getProduct(String namaPotongan, String hargaPotongan, String photoUrl,
  //     [DocumentSnapshot? documentSnapshot]){
  //       return
  //     }
}
