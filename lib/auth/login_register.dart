// import 'package:e_barber_v2/barberman/auth/login_barberman.dart';
// import 'package:e_barber_v2/pelanggan/auth/login_pelanggan.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          // margin: EdgeInsets.only(top: 40.0),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 2),
            child: const Text(
              "E-Barber",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              authValidation.action == 'login' ? "Login" : "Register",
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 173, 166, 166)),
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
                  heroTag: authValidation.action == 'login'
                      ? "LoginBarberman"
                      : "RegisterBarberman",
                  backgroundColor: const Color(0xff20639B),
                  label: const Text("Barberman"),
                  onPressed: () {
                    if (authValidation.action == 'register') {
                      authValidation.role = 'barberman';
                      if (authValidation.role == 'barberman') {
                        Navigator.pushNamed(context, '/register-form');
                      } else {
                        authValidation.role == 'pelanggan';
                        Navigator.pushNamed(context, '/register-form');
                      }
                    } else if (authValidation.action == 'login') {
                      authValidation.role = 'barberman';
                      if (authValidation.role == 'barberman') {
                        Navigator.pushNamed(context, '/login-form');
                      } else {
                        authValidation.role == 'pelanggan';
                        Navigator.pushNamed(context, '/login-form');
                      }
                    }
                  },
                ),
              )),
          Container(
              child: SizedBox(
            width: 250,
            height: 50,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              heroTag: authValidation.action == 'login'
                  ? "LoginPelanggan"
                  : "RegisterPelanggan",
              backgroundColor: const Color(0xff20639B),
              label: const Text("Pelanggan"),
              onPressed: () {
                if (authValidation.action == 'register') {
                  authValidation.role = 'pelanggan';
                  if (authValidation.role == 'pelanggan') {
                    Navigator.pushNamed(context, '/register-form');
                  } else {
                    authValidation.role == 'barberman';
                    Navigator.pushNamed(context, '/register-form');
                  }
                } else if (authValidation.action == 'login') {
                  authValidation.role = 'pelanggan';
                  if (authValidation.role == 'pelanggan') {
                    Navigator.pushNamed(context, '/login-form');
                  } else {
                    authValidation.role == 'barberman';
                    Navigator.pushNamed(context, '/login-form');
                  }
                }
              },
            ),
          )),
        ],
      )),
    );
  }
}
