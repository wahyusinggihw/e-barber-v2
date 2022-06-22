import 'package:e_barber_v2/auth/login.dart';
import 'package:e_barber_v2/auth/register.dart';
import 'package:e_barber_v2/views/barberman/logout.dart';
import 'package:e_barber_v2/views/bottombar.dart';
import 'package:e_barber_v2/views/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:e_barber_v2/auth/login_register.dart';
import 'auth/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainMenu());
      case '/login-register':
        return MaterialPageRoute(builder: (_) => LoginRegister());
      case '/login-form':
        return MaterialPageRoute(builder: (_) => Login());
      case '/register-form':
        return MaterialPageRoute(builder: (_) => Register());
      case '/home':
        return MaterialPageRoute(builder: (_) => BottomBar());
      case '/logout-dialog':
        return MaterialPageRoute(builder: (_) => Logout());
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
