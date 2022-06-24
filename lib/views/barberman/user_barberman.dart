// import 'package:e_barber/auth.dart';
import 'package:e_barber_v2/views/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '/provider/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_barber_v2/models/user_model.dart';

class UserBarberman extends StatefulWidget {
  const UserBarberman({Key? key}) : super(key: key);

  @override
  _UserBarbermanState createState() => _UserBarbermanState();
}

class _UserBarbermanState extends State<UserBarberman> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    UserModel getUser = UserModel();

    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: Scaffold(
        body: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: const Text(
                        "Profil | Barberman",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900),
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
                          fit: BoxFit.fill,
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
                              child: Text(
                                  authProvider.getUser()!.email.toString()),
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
                              child: FutureBuilder(
                                future: getUser.getUser(
                                    field: 'first_name', collection: 'users'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data.toString());
                                  } else {
                                    return Text("");
                                  }
                                },
                              ),
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
                              child: FutureBuilder(
                                future: getUser.getUser(
                                    field: 'role', collection: 'users'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data.toString());
                                  } else {
                                    return Text("");
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/logout-dialog');
                            // FirebaseAuth.instance
                            //     .authStateChanges()
                            //     .listen((User? user) {
                            //   if (user != null) {
                            //     Navigator.pushNamed(context, '/home');
                            //   } else {
                            //     // print("login dulu");
                            //     Navigator.pushNamed(context, '/');
                            //   }
                            // });
                            // Route route = MaterialPageRoute(builder: (context) => const AuthMain());
                            // Navigator.push(context,route);
                          },
                          child: Text("Logout",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  wordSpacing: 10,
                                  height: 2)),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
