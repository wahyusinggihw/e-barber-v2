// import 'package:e_barber/auth.dart';
import 'package:flutter/material.dart';

class UserBarberman extends StatefulWidget {
  const UserBarberman({Key? key}) : super(key: key);

  @override
  _UserBarbermanState createState() => _UserBarbermanState();
}

class _UserBarbermanState extends State<UserBarberman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            child: Text("Wahyu@"),
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
                            child: Text("Wahyu Singgih"),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: () {
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
    );
  }
}
