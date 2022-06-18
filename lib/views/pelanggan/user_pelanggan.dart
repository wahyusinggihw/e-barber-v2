// import 'package:e_barber/barberman/bottombar_barberman.dart';
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
        child: Text("User pelanggan"),
      ),
    );
  }
}
