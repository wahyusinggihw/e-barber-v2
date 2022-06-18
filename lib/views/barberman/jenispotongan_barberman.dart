// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';

class ListPotongan extends StatefulWidget {
  const ListPotongan({Key? key}) : super(key: key);

  @override
  _ListPotonganState createState() => _ListPotonganState();
}

class _ListPotonganState extends State<ListPotongan> {
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
                      "Barbershop 1",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Column(
                    children: [],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
