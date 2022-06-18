import 'package:e_barber_v2/auth/form_login.dart';
import 'package:e_barber_v2/auth/form_register.dart';
import 'package:e_barber_v2/bottombar.dart';
import 'package:flutter/material.dart';
import 'auth/auth_main.dart';
import 'package:e_barber_v2/auth/login_register.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthMain());
      case '/login-register':
        return MaterialPageRoute(builder: (_) => LoginRegister());
      case '/login-form':
        return MaterialPageRoute(builder: (_) => LoginForm());
      case '/register-form':
        return MaterialPageRoute(builder: (_) => RegisterForm());
      case '/home':
        return MaterialPageRoute(builder: (_) => BottomBar());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Page Not Found')),
      );
    });
  }
}
