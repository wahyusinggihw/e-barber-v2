import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  late final String documentId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference order =
      FirebaseFirestore.instance.collection('order');

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

  Future<String?> createOrder({
    required String barberId,
    namaBarber,
    namaPelanggan,
    alamatPelanggan,
    idnama,
    namaPotongan,
    hargaPotongan,
    photoUrl,
  }) async {
    try {
      order.doc(_auth.currentUser!.uid).set({
        // 'created': simpanTimeStamp.time,
        'uid': _auth.currentUser!.uid,
        'id_barber': barberId,
        'nama_barber': namaBarber,
        'nama_pelanggan': namaPelanggan,
        'alamat_pelanggan': alamatPelanggan,
        'id_potongan': idnama,
        'nama_potongan': namaPotongan,
        'photo_url': photoUrl,
        'harga': hargaPotongan,
        'status': '',
      });
      return 'Success';
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> statusOrder({required String status}) async {
    try {
      // order.doc('uid').update(data)
      // print(getDoc);
      // order.doc();
      return 'Success';
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> doneOrder() async {
    try {
      order.doc(_auth.currentUser!.uid).delete();
      // order.doc();
      return 'Success';
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}
