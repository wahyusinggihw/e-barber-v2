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

class UserPelanggan extends StatefulWidget {
  const UserPelanggan({Key? key}) : super(key: key);

  @override
  _UserPelangganState createState() => _UserPelangganState();
}

class _UserPelangganState extends State<UserPelanggan> {
  // PlatformFile? pickedFile;

  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    UserModel getUser = UserModel();
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

    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          actions: [
            IconButton(
              splashRadius: 18,
              icon: Icon(
                Icons.settings,
                color: Color(0xff20639B),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/setting-pelanggan');
                // do something
              },
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          // foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            // padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  "Profil | Pelanggan",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
              FutureBuilder(
                future:
                    getUser.getUser(field: 'photo_url', collection: 'users'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                        height: 150,
                        width: 500,
                        color: Color(0xff6d8ea1),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(snapshot.data.toString()),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
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
                    );
                  } else {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                        height: 150,
                        width: 500,
                        color: Color(0xff6d8ea1),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Icon(
                            // onPressed: selectFile,
                            Icons.camera_alt_rounded,
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
                    );
                  }
                },
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
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/logout-dialog');
                    // Route route = MaterialPageRoute(builder: (context) => const AuthMain());
                    // Navigator.push(context,route);
                  },
                  child: Text("Logout",
                      style: TextStyle(
                          color: Color(0xff20639B),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          // wordSpacing: 10,
                          height: 5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
