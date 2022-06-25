import 'package:e_barber_v2/models/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // var currentUser;
  FirebaseFirestore db = FirebaseFirestore.instance;

  final time = Timestamp.now();

  // Future<String> getSpecie(String userID) async {
  //   DocumentReference documentReference = streamSnapshot.document(userID);
  //   String user;
  //   await documentReference.get().then((snapshot) {
  //     user = snapshot.data['users'].toString();
  //   });
  //   return user;
  // }

  getUser() {
    return _auth.currentUser;
  }

  Future logOut() {
    var result = _auth.signOut();
    notifyListeners();
    return result;
  }

  Future<String?> signUp({
    required String firstName,
    lastName,
    email,
    password,
    roleId,
    saldo,
  }) async {
    simpanTimeStamp.time = time.toString();
    try {
      var u = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((cred) {
        if (roleId != 'barberman') {
          db.collection('users').doc(cred.user?.uid).set({
            'role': roleId,
            'first_name': firstName,
            'last_name': lastName,
          });
          db.collection('saldo').doc(cred.user?.uid).set({
            'role': roleId,
            'saldo': saldo,
          });
        } else {
          db.collection('users').doc(cred.user?.uid).set({
            'role': roleId,
            'first_name': firstName,
            'last_name': lastName,
          });
          db.collection('saldo').doc(cred.user?.uid).set({
            'role': roleId,
            'saldo': saldo,
          });
          db
              .collection('jenis_potongan')
              .doc(cred.user?.uid)
              .collection('potongans')
              .doc(simpanTimeStamp.time)
              .set({
            'created': simpanTimeStamp.time,
            'photo_url': '',
            'nama': '',
            'harga': '',
          });
        }
      });

      // u.user!.updatePhotoURL(roleId);
      // u.user!.updateDisplayName(firstName + ' ' + lastName);
      // print(u.user!.uid);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Password lemah.';
      } else if (e.code == 'email-already-in-use') {
        return 'Email sudah digunakan.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Akun belum terdaftar.';
      } else if (e.code == 'wrong-password') {
        return 'Password salah.';
      } else if (e.code == 'invalid-email') {
        return 'Email tidak valid.';
      } else if (e.code == 'too-many-requests') {
        return 'Login error, coba lagi nanti.';
      } else {
        // print(e.code);
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      notifyListeners();
      return 'Success';
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      if (e.code == 'user-not-found') {
        return 'Akun masih belum terdaftar.';
      } else if (e.code == 'invalid-email') {
        return 'Email tidak valid';
      }
      return e.message;
    }
  }

  // Future createUser(
  //     {required String firstName,
  //     required String lastName,
  //     required String email,
  //     required String password}) async {
  //   Map<String, String> _data = {};
  //   var u = await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   u.user!.updateDisplayName(firstName + ' ' + lastName);
  // }

  // Future logIn(String email, String password, {String error = ''}) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     // ScaffoldMessenger.of(context).showSnackBar(loginSuccess);
  //     notifyListeners();
  //     // return result.user;
  //   } on FirebaseAuthException catch (e) {
  //     error = e.code;
  //     return error;
  //     // print("failed ${e.code}" "${e.message}");
  //   }
  // }

  // Future signIn(String email, String password) async {
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     notifyListeners();
  //     return 'Success';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       return 'The password provided is too weak.';
  //     } else if (e.code == 'email-already-in-use') {
  //       return 'The account already exists for that email.';
  //     } else if (e.code == 'invalid-email') {
  //       return 'Email tidak valid.';
  //     } else if (e.code == 'wrong-password') {
  //       return 'Password salah.';
  //     } else if (e.code == 'user-not-found') {
  //       return 'Email tidak terdaftar.';
  //     } else if (e.code == 'too-many-requests') {
  //       return 'Login error, coba lagi nanti';
  //     } else {
  //       return e.message;
  //       // switch (e.code) {
  //       //   case "invalid-email":
  //       //     errorCode = "Email tidak valid";
  //       //     break;
  //       //   case "wrong-password":
  //       //     errorCode = "Password salah";
  //       //     break;
  //       //   case "user-not-found":
  //       //     errorCode = "Akun belum terdaftar";
  //       //     break;
  //       //   case "too-many-requests":
  //       //     errorCode = "Login error, coba lagi nanti";
  //       //     break;
  //       //   default:
  //       // }
  //     }
  //     // return errorCode;
  //   }
  // }
}
