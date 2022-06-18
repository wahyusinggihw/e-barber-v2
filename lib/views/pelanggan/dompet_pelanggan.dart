// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';

class DompetPelanggan extends StatefulWidget {
  const DompetPelanggan({Key? key}) : super(key: key);

  @override
  _DompetPelangganState createState() => _DompetPelangganState();
}

class _DompetPelangganState extends State<DompetPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Dompet pelanggan"),
      ),
    );
  }
}
