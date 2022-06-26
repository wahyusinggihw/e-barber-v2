import 'package:e_barber_v2/models/models.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class BarbermanModel {
  final CollectionReference modelrambut =
      FirebaseFirestore.instance.collection('jenis_potongan');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final imagePicker = ImagePicker();
  final time = Timestamp.now();

  Future<String?> createModelRambut({
    required String idnama,
    namaPotongan,
    hargaPotongan,
    photoUrl,
  }) async {
    try {
      simpanTimeStamp.time = time.toString();
      modelrambut
          .doc(_auth.currentUser!.uid)
          .collection('potongans')
          .doc(idnama)
          .set({
        // 'created': simpanTimeStamp.time,
        'idnama': idnama,
        'nama': namaPotongan,
        'photo_url': photoUrl,
        'harga': hargaPotongan
      });
      return 'Success';
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateModelRambut({
    required String idnama,
    namaPotongan,
    hargaPotongan,
    photoUrl,
  }) async {
    try {
      final update = modelrambut
          .doc(_auth.currentUser!.uid)
          .collection('potongans')
          .doc(idnama);

      update.update({
        'idnama': idnama,
        'nama': namaPotongan,
        'photo_url': photoUrl,
        'harga': hargaPotongan
      });

      return 'Success';
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> deleteModelRambut({
    required String idnama,
  }) async {
    try {
      modelrambut
          .doc(_auth.currentUser!.uid)
          .collection('potongans')
          .doc(idnama)
          .delete();
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }

    // modelrambut
    //     .doc(_auth.currentUser!.uid)
    //     .collection('potongans')
    //     .doc(simpanTimeStampAuth.time)
    //     .delete();
  }

  Future pickImage() async {
    final result = await imagePicker.pickImage(source: ImageSource.gallery);
  }
}





// class RambutModel {
//   final CollectionReference productss =
//       FirebaseFirestore.instance.collection('jenispotongan');

//   Future<void> createOrUpdate(
//       String namaPotongan, String hargaPotongan, String photoUrl,
//       [DocumentSnapshot? documentSnapshot]) async {
//     String action = 'create';
//     if (documentSnapshot != null) {
//       action = 'update';
//       photoUrl = documentSnapshot['photo_url'];
//       namaPotongan = documentSnapshot['nama_potongan'];
//       hargaPotongan = documentSnapshot['harga'].toString();
//     }
//   }

//   // Future<void> getProduct(String namaPotongan, String hargaPotongan, String photoUrl,
//   //     [DocumentSnapshot? documentSnapshot]){
//   //       return
//   //     }
// }
