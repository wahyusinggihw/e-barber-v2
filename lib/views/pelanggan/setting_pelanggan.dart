// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'dart:io';
import 'package:e_barber_v2/models/models.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SettingPelanggan extends StatefulWidget {
  const SettingPelanggan({Key? key}) : super(key: key);

  @override
  _SettingPelangganState createState() => _SettingPelangganState();
}

class _SettingPelangganState extends State<SettingPelanggan> {
  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserModel getUser = UserModel();
    UserModel updateUser = UserModel();
    UserRole currentUserRole = UserRole();
    final authProvider = Provider.of<AuthService>(context, listen: false);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    TableRow buildRow(List<String> cells) => TableRow(
            children: cells.map(
          (cell) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text(cell),
              ),
            );
          },
        ).toList());

    Future<String> data2() async {
      var data1 = (await FirebaseFirestore.instance
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .get())
          .data()!['role']
          .toString();
      return data1;
    }

    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          leading: IconButton(
            splashRadius: 25,
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // title: Text("<", style: TextStyle(color: Colors.black),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            // padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  "Profile",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  height: 150,
                  width: 500,
                  color: Color(0xff6d8ea1),
                  child: pickedFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File(pickedFile!.path!),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          child: IconButton(
                            onPressed: selectFile,
                            icon: Icon(Icons.add_a_photo_rounded),
                            color: Colors.white,
                          ),
                        ),
                ),
                // child: SizedBox(
                //   height: 150,
                //   width: 500,
                //   child: Image.asset(
                //     'assets/images/beranda.png',
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future:
                      getUser.getUser(field: 'first_name', collection: 'users'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Table(
                        // border: TableBorder.all(),
                        columnWidths: {
                          0: FractionColumnWidth(0.30),
                          1: FractionColumnWidth(0.10)
                        },
                        children: [
                          buildRow([
                            'Email',
                            ':',
                            authProvider.getUser()!.email.toString()
                          ]),
                          buildRow(['Nama', ':', snapshot.data.toString()]),
                        ],
                      );
                    }
                    return Text('');
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  heroTag: 'addpotongan',
                  backgroundColor: const Color(0xff20639B),
                  onPressed: () async {
                    print(currentUserRole.role);
                    if (pickedFile != null) {
                      final path = 'users/' + _auth.currentUser!.uid;
                      final file = File(pickedFile!.path!);
                      final ref = firebase_storage.FirebaseStorage.instance
                          .ref()
                          .child(path);
                      final uploadTask = ref.putFile(file);
                      // String imageUrl = await ref.getDownloadURL();
                      final snapshot = await uploadTask.whenComplete(() {});
                      final urlDownload = await snapshot.ref.getDownloadURL();
                      simpanDownloadUrl.url = urlDownload;
                      print(simpanDownloadUrl.url);

                      updateUser.updateUserPelanggan(
                          roleId: currentUserRole.role,
                          photoUrl: simpanDownloadUrl.url);

                      Navigator.pop(context);
                    }

                    // Route route = MaterialPageRoute(builder: (context) => const AuthMain());
                    // Navigator.push(context,route);
                  },
                  label: const Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
