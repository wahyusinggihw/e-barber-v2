import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  static late String photoUrl, nama, harga, id;
}

class simpanDataBarbers {
  static late String firstname, lastname, harga, uid;
}

class simpanDataOrder {
  static late String namaPotongan,
      harga,
      namaPelanggan,
      uid,
      id,
      alamat,
      nohp,
      photoUrl;
}

class authValidation {
  static late String role = '', action = '';
}

class simpanBiography {
  static late String email = '', nama, nohp;
}

class simpanDownloadUrl {
  static late String url;
}

class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}
