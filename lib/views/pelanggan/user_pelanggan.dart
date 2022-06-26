// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'dart:math';

import 'package:e_barber_v2/models/models.dart';
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
        body: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
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
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: SizedBox(
                  height: 150,
                  width: 500,
                  child: Image.asset(
                    'assets/images/beranda.png',
                    fit: BoxFit.cover,
                  ),
                ),
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
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          // wordSpacing: 10,
                          height: 2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
