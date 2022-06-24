import 'dart:async';
import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var formData = FormData();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // final auth = AuthService();

    // var error = authProvider.errorCode;

    // final email = TextFormField(
    //   controller: _emailController,
    //   keyboardType: TextInputType.emailAddress,
    //   autofocus: true,
    //   // initialValue: 'example@gmail.com',
    //   decoration: InputDecoration(
    //     hintText: 'Email',
    //     contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    //   ),
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return "Email Wajib diisi";
    //     } else {
    //       // formData.email = value;
    //       return null;
    //     }
    //   },
    // );

    // final password = TextFormField(
    //   controller: _passwordController,
    //   autofocus: false,
    //   // initialValue: 'password',
    //   obscureText: true,
    //   decoration: InputDecoration(
    //     hintText: 'Password',
    //     contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    //   ),
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return "Password Wajib diisi";
    //     } else {
    //       // formData.password = value;
    //       return null;
    //     }
    //   },
    // );

    // final loginButton = Padding(
    //     padding: EdgeInsets.symmetric(vertical: 16),
    //     child: SizedBox(
    //       width: 250,
    //       height: 50,
    //       child: FloatingActionButton.extended(
    //         shape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //         heroTag: authValidation.role == 'barberman'
    //             ? "LoginBarberman"
    //             : "LoginPelanggan",
    //         backgroundColor: const Color(0xff20639B),
    //         onPressed: () {
    //           signIn();
    //           FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //             if (user != null) {
    //               print(user.tenantId);
    //             }
    //           });
    //         },
    //         label: const Text("Login"),
    //       ),
    //     ));

    // final registerButton = SizedBox(
    //   width: 250,
    //   height: 50,
    //   child: FloatingActionButton.extended(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     heroTag: authValidation.role == 'barberman'
    //         ? "RegisterBarberman"
    //         : "RegisterPelanggan",
    //     backgroundColor: const Color(0xff555C62),
    //     onPressed: () async {
    //       // authValidation.role == 'barberman' ? 'barberman' : 'pelanggan';
    //       authValidation.action = 'register';
    //       Navigator.pushNamed(context, '/register-form');
    //     },
    //     label: const Text("Register"),
    //   ),
    // );

    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: Scaffold(
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
          // title: Text("<", style: TextStyle(color: Colors.black),),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 55, right: 55),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Text(
                                "Form login",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Text(
                                  authValidation.role == 'barberman'
                                      ? 'Barberman'
                                      : 'Pelanggan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      color:
                                          Color.fromARGB(255, 173, 166, 166)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                            "E-Barber merupakan tempat pangkas rambut yang akan melayani anda tanpa harus keluar rumah.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                wordSpacing: 10,
                                height: 2)),
                      ])),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        // initialValue: 'wahyu@gmail.com',
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Wajib diisi";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        autofocus: false,
                        // initialValue: 'wahyusinggih',
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Wajib diisi";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // children: [lupaPassword],
                children: [
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: Text("Lupa Password?",
                        style: TextStyle(color: Colors.grey)),
                    onPressed: () async {
                      final message = await authProvider.forgotPassword(
                          email: _emailController.text);
                      if (message!.contains('Success')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Link reset password berhasil dikirim.'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(message),
                        ));
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    heroTag: authValidation.role == 'barberman'
                        ? "LoginBarberman"
                        : "LoginPelanggan",
                    backgroundColor: const Color(0xff20639B),
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      final message = await authProvider.signIn(
                          email: _emailController.text,
                          password: _passwordController.text);

                      if (message!.contains('Success')) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text('Signed in as ' +
                                authProvider
                                    .getUser()!
                                    .displayName
                                    .toString())));
                        CircularProgressIndicator();
                        Navigator.pushNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(message),
                        ));
                      }

                      //   authProvider.signIn(
                      //       _emailController.text, _passwordController.text);
                      //   FirebaseAuth.instance.authStateChanges().listen(
                      //     (User? user) {
                      //       if (user != null) {
                      //         Navigator.pushNamed(context, '/home');
                      //         // print(FirebaseAuth.instance.currentUser);
                      //         // ScaffoldMessenger.of(context)
                      //         //     .showSnackBar(loginSuccess);
                      //         // print(user.uid);
                      //       } else {
                      //         print(authProvider.errorCode);
                      //       }
                      //     },
                      //   );
                      // }
                    },
                    label: const Text("Login"),
                  ),
                ),
              ),
              // SizedBox(height: 8),
              SizedBox(
                width: 250,
                height: 50,
                child: FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  heroTag: authValidation.role == 'barberman'
                      ? "RegisterBarberman"
                      : "RegisterPelanggan",
                  backgroundColor: const Color(0xff555C62),
                  onPressed: () async {
                    // authValidation.role == 'barberman' ? 'barberman' : 'pelanggan';
                    authValidation.action = 'register';
                    Navigator.pushNamed(context, '/register-form');
                  },
                  label: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
