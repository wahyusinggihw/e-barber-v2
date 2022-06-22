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
// import 'package:e_barber_v2/models/model_pelanggan.dart';
// import 'package:e_barber_v2/models/model_barberman.dart';
import 'package:flutter/material.dart';
import '../provider/auth_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  // const BottomBar({Key? key}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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

  // roleSwitch() {
  //   if (authRole.role == 'barberman') {
  //     return _childrenBarberman;
  //   } else {
  //     return _childrenPelanggan;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);

    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: Scaffold(
        body: authProvider.getUser()!.photoURL == 'barberman'
            ? _childrenBarberman[_currentIndex]
            : _childrenPelanggan[_currentIndex],
        // body: authValidation.role == 'barberman'
        //     ? _childrenBarberman[_currentIndex]
        //     : _childrenPelanggan[_currentIndex],
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
