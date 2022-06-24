import 'package:e_barber_v2/views/barberman/beranda_barberman.dart';
import 'package:e_barber_v2/views/barberman/chat_barberman.dart';
import 'package:e_barber_v2/views/barberman/dompet_barberman.dart';
import 'package:e_barber_v2/views/barberman/jenispotongan_barberman.dart';
import 'package:e_barber_v2/views/barberman/order_barberman.dart';
import 'package:e_barber_v2/views/barberman/user_barberman.dart';
import 'package:e_barber_v2/views/pelanggan/beranda_pelanggan.dart';
import 'package:e_barber_v2/views/pelanggan/chat_pelanggan.dart';
import 'package:e_barber_v2/views/pelanggan/dompet_pelanggan.dart';
import 'package:e_barber_v2/views/pelanggan/order_pelanggan.dart';
import 'package:e_barber_v2/views/pelanggan/user_pelanggan.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  int _currentIndex = 0;

  void onBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _childrenBarberman = [
    // BerandaBarberman(),
    BerandaBarberman(),
    ChatBarberman(),
    ListPotongan(),
    DompetBarberman(),
    UserBarberman(),
  ];

  final List<Widget> _childrenPelanggan = [
    // BerandaBarberman(),
    BerandaPelanggan(),
    ChatPelanggan(),
    OrderPelanggan(),
    DompetPelanggan(),
    UserPelanggan(),
  ];

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUserRole = UserRole();

    Future<String> data2() async {
      var data1 = (await FirebaseFirestore.instance
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .get())
          .data()!['role']
          .toString();
      return data1;
    }

    // FutureBuilder(
    //   future: data2(),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasData) {
    //       currentUserRole.role = snapshot.data;
    //       if (currentUserRole.role == 'barberman') {
    //         _childrenBarberman[_currentIndex];
    //       }
    //     }
    //   },
    // );

    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: Scaffold(
        body: FutureBuilder(
          future: data2(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              currentUserRole.role = snapshot.data;
              if (currentUserRole.role == 'barberman') {
                return _childrenBarberman[_currentIndex];
              } else {
                return _childrenPelanggan[_currentIndex];
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onBarTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white24,
            backgroundColor: const Color(0xff20639B),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                  backgroundColor: Color(0xff20639B)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined),
                  label: "Chat",
                  backgroundColor: Color(0xff20639B)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  label: "Order",
                  backgroundColor: Color(0xff20639B)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  label: "Dompet",
                  backgroundColor: Color(0xff20639B)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: "User",
                  backgroundColor: Color(0xff20639B)),
            ],
          ),
        ),
      ),
    );
  }
}
