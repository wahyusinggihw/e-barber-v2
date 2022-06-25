import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ModelRambut with ChangeNotifier {
  final CollectionReference modelrambut =
      FirebaseFirestore.instance.collection('jenis_potongan');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> createModelRambut({
    required String namaPotongan,
    hargaPotongan,
    photoUrl,
  }) async {
    try {
      modelrambut.doc(_auth.currentUser!.uid).set({
        'photo_url': photoUrl,
        'nama_potongan': namaPotongan,
        'harga_potongan': hargaPotongan
      });

      // if (documentSnapshot != null && action == 'create') {
      //   modelrambut.doc().set({
      //     'photoUrl': action,
      //   });
      // } else if (documentSnapshot != null && action == 'update') {
      //   action = '';
      //   photoUrl = documentSnapshot['photo_url'];
      //   namaPotongan = documentSnapshot['nama'];
      //   hargaPotongan = documentSnapshot['harga'].toString();
      // } else if (action == 'create') {
      //   modelrambut.doc().set({
      //     'photo_url': photoUrl,
      //     'nama_potongan': namaPotongan,
      //     'harga_potongan': hargaPotongan
      //   });
      // }
      notifyListeners();
      return 'Success';
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}
