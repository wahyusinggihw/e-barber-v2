// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserPelanggan extends StatefulWidget {
  const UserPelanggan({Key? key}) : super(key: key);

  @override
  _UserPelangganState createState() => _UserPelangganState();
}

class _UserPelangganState extends State<UserPelanggan> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);
    final CollectionReference _users =
        FirebaseFirestore.instance.collection('users');
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: Scaffold(
        body: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: const Text(
                      "Profil | Pelanggan",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text("Email"),
                          ),
                          Container(
                            child: Text(":"),
                          ),
                          Container(
                            child:
                                Text(authProvider.getUser()!.email.toString()),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Nama"),
                          ),
                          Container(
                            child: Text(":"),
                          ),
                          Container(
                            child: Text(
                                authProvider.getUser()!.displayName.toString()),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Role"),
                          ),
                          Container(
                            child: Text(":"),
                          ),
                          Container(
                            child: Text(
                                authProvider.getUser()!.photoURL.toString()),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
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
