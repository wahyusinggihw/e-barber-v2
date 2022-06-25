import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_barber_v2/models/models.dart';
import '../provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final _loginKey = GlobalKey<_RegisterState>();
  final _formKey = GlobalKey<FormState>();
  var formData = FormData();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);

    final firstName = TextFormField(
      controller: _firstNameController,
      keyboardType: TextInputType.name,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Nama depan',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Wajib diisi";
        } else {
          // formData.email = value;
          return null;
        }
      },
    );

    final lastName = TextFormField(
      controller: _lastNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Nama belakang (Opsional)',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
          // return "Nama belakang wajib diisi";
        } else {
          // formData.email = value;
          return null;
        }
      },
    );

    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      // initialValue: 'example@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email Wajib diisi";
        } else {
          // formData.email = value;
          return null;
        }
      },
    );

    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      // initialValue: 'password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Password Wajib diisi";
        } else if (value.length < 8) {
          return "Password harus lebih dari 8 huruf";
        } else {
          // formData.password = value;
          return null;
        }
      },
    );

    final confirmPassword = TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Konfirmasi password',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return _confirmPasswordController.text +
              " Konfirmasi password wajib diisi";
        } else if (value != _passwordController.text) {
          return 'Password tidak cocok';
        } else {
          return null;
          // formData.confirmPassword = value;
          // return null;
        }
      },
    );

    // final roleForm = Visibility(
    //   visible: true,
    //   child: TextFormField(
    //     // controller: _roleController,
    //     initialValue:
    //         authValidation.role == 'barberman' ? 'barberman' : 'pelanggan',
    //     validator: (value) {
    //       if (value!.isNotEmpty) {
    //         formData.role = value;
    //       }
    //       return null;
    //     },
    //   ),
    // );
    // final registerButton = Padding(
    //     padding: EdgeInsets.symmetric(vertical: 16),
    //     child: SizedBox(
    //       width: 250,
    //       height: 50,
    //       child: FloatingActionButton.extended(
    //         shape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //         heroTag: authValidation.role == 'barberman'
    //             ? "RegisterBarberman"
    //             : "RegisterPelanggan",
    //         backgroundColor: const Color(0xff20639B),
    //         onPressed: () {
    //           authProvider.signUp(
    //               _emailController.text, _passwordController.text);
    //           // if (_formKey.currentState!.validate()) {
    //           // Navigator.pushNamed(context, '/home');
    //           // simpanData.password = formData.password;
    //           // simpanData.confirmPassword = formData.confirmPassword;
    //           // }
    //           //
    //         },
    //         label: const Text("Register"),
    //       ),
    //     ));

    // final lupaPassword = TextButton(
    //   style: ButtonStyle(
    //       overlayColor: MaterialStateProperty.all(Colors.transparent)),
    //   child: Text("Sudah punya akun?", style: TextStyle(color: Colors.grey)),
    //   onPressed: () {},
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
                                  "Form Register",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Text(
                                    authValidation.role == 'barberman'
                                        ? 'barberman'
                                        : 'Pelanggan',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        color:
                                            Color.fromARGB(255, 173, 166, 166)),
                                  ),
                                ),
                              ],
                            )),
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
                      // roleForm,
                      firstName,
                      const SizedBox(height: 8),
                      lastName,
                      const SizedBox(height: 8),
                      email,
                      const SizedBox(height: 8),
                      password,
                      const SizedBox(height: 8),
                      confirmPassword,
                      const SizedBox(height: 8),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Sudah punya akun?",
                      style: TextStyle(color: Colors.grey)),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: Text("Login.",
                        style: TextStyle(color: Color(0xff20639B))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login-form');
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
                        ? "RegisterBarberman"
                        : "RegisterPelanggan",
                    backgroundColor: const Color(0xff20639B),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // print(formData.role);
                        var message = await authProvider.signUp(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            roleId: authValidation.role == 'barberman'
                                ? 'barberman'
                                : 'pelanggan',
                            saldo: 0);
                        if (message!.contains('Success')) {
                          // Navigator.pushNamed(context, '/home');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Register success, please login. ')));
                          Navigator.pushNamed(context, '/login-form');
                        } else {
                          // print(message);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(message),
                          ));
                        }
                      }
                    },
                    label: const Text("Register"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
