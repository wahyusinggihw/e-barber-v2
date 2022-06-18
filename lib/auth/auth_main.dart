// import 'package:e_barber/auth_login.dart';
// import 'package:e_barber/auth_register.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:flutter/material.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: Center(
          // margin: EdgeInsets.only(top: 40.0),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: const Text(
              "E-Barber",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
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
                  heroTag: "register",
                  backgroundColor: const Color(0xff20639B),
                  onPressed: () {
                    // Route route = MaterialPageRoute(builder: (context) => const AuthRegister());
                    // Navigator.push(context, route);
                    authValidation.action = 'register';
                    Navigator.pushNamed(context, '/login-register');
                  },
                  label: const Text("Register"),
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
                authValidation.action = 'login';
                Navigator.pushNamed(context, '/login-register');
              },
              label: const Text("Login"),
            ),
          )),
        ],
      )),
    );
  }
}
