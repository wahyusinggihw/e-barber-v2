// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class UserPelanggan extends StatefulWidget {
  const UserPelanggan({Key? key}) : super(key: key);

  @override
  _UserPelangganState createState() => _UserPelangganState();
}

class _UserPelangganState extends State<UserPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Nama'),
                        Container(
                          width: 100,
                        ),
                        Text(': Hanos')
                      ],
                    ),
                    Row(
                      children: [
                        Text('Email'),
                        Container(
                          width: 100,
                        ),
                        Text(': Wahyu@gmail.com')
                      ],
                    ),
                    Row(
                      children: [
                        Text('Jenis Kelamin'),
                        Container(
                          width: 50,
                        ),
                        Text(': L')
                      ],
                    ),
                    Row(
                      children: [
                        Text('Alamat'),
                        Container(
                          width: 50,
                        ),
                        Text(': Sambangan')
                      ],
                    ),
                  ],
                ),
                Table(
                  border: TableBorder.all(color: Colors.amber, width: 1),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Text("data"),
                        ),
                        Center(
                          child: TableCell(
                            child: Text(":"),
                          ),
                        ),
                        TableCell(
                          child: Text("data"),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
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
                            child: Text("Wahyu@undiksha.ac.id"),
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
                      Row(
                        children: [
                          Container(
                            child: Text("Jenis Kelamin"),
                          ),
                          Container(
                            child: Text(":"),
                          ),
                          Container(
                            child: Text("L"),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Alamat"),
                          ),
                          Container(
                            child: Text(":"),
                          ),
                          Container(
                            child: Text("Sambangan"),
                          )
                        ],
                      ),
                    ],
                  ),
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
                              // wordSpacing: 10,
                              height: 2)),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
