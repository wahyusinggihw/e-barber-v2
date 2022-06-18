// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';

class DompetBarberman extends StatefulWidget {
  const DompetBarberman({Key? key}) : super(key: key);

  @override
  _DompetBarbermanState createState() => _DompetBarbermanState();
}

class _DompetBarbermanState extends State<DompetBarberman> {
  final _loginKey = GlobalKey<_DompetBarbermanState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Dompet barberman"),
      ),
    );
  }
}
