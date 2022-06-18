import 'package:e_barber_v2/routes.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute));
}



// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "E-Barber",
//       home: AuthMain(),
//     );
//   }
// }
