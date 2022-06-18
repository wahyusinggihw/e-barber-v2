// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';

class OrderBarberman extends StatefulWidget {
  const OrderBarberman({Key? key}) : super(key: key);

  @override
  _OrderBarbermanState createState() => _OrderBarbermanState();
}

class _OrderBarbermanState extends State<OrderBarberman> {
  final _loginKey = GlobalKey<_OrderBarbermanState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Order barberman"),
      ),
    );
  }
}
