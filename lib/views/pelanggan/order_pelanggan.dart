// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';

class OrderPelanggan extends StatefulWidget {
  const OrderPelanggan({Key? key}) : super(key: key);

  @override
  _OrderPelangganState createState() => _OrderPelangganState();
}

class _OrderPelangganState extends State<OrderPelanggan> {
  final _loginKey = GlobalKey<_OrderPelangganState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Order pelanggan"),
      ),
    );
  }
}
