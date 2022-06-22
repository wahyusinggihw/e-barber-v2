import 'package:flutter/material.dart';
import 'package:e_barber_v2/models/models.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // margin: EdgeInsets.only(top: 40.0),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Text(
                  "E - Barber",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Main Menu',
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 173, 166, 166)),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: 250,
                height: 50,
                child: FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  heroTag: "mainmenu",
                  backgroundColor: const Color(0xff20639B),
                  onPressed: () {
                    // Route route = MaterialPageRoute(builder: (context) => const AuthRegister());
                    // Navigator.push(context, route);
                    authValidation.role = 'barberman';
                    Navigator.pushNamed(context, '/login-form');
                  },
                  label: const Text("Barberman"),
                ),
              )),
          Container(
              child: SizedBox(
            width: 250,
            height: 50,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              heroTag: "Login",
              backgroundColor: const Color(0xff20639B),
              onPressed: () {
                authValidation.role = 'pelanggan';
                Navigator.pushNamed(context, '/login-form');
              },
              label: const Text("Pelanggan"),
            ),
          )),
        ],
      )),
    );
  }
}
