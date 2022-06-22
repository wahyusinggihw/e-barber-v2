import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Anda yakin ingin keluar?",
                style: GoogleFonts.cabin(
                    fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 63,
                  height: 43,
                  child: FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    heroTag: 'logoutya',
                    backgroundColor: const Color(0xff20639B),
                    onPressed: () async {
                      authProvider.logOut();
                      Navigator.pushNamed(context, '/');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Successfully logout from ' +
                              authProvider.getUser()!.displayName.toString())));
                      // authValidation.role == 'barberman' ? 'barberman' : 'pelanggan';
                      // Navigator.pushNamed(context, '/register-form');
                    },
                    label: Text("Ya",
                        style: GoogleFonts.cabin(
                          fontSize: 14,
                        )),
                  ),
                ),
                Container(
                  width: 20,
                ),
                Container(
                  width: 63,
                  height: 43,
                  child: FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    heroTag: 'logouttidak',
                    backgroundColor: const Color(0xff555C62),
                    onPressed: () async {
                      Navigator.pop(context);
                      // authValidation.role == 'barberman' ? 'barberman' : 'pelanggan';
                      // Navigator.pushNamed(context, '/register-form');
                    },
                    label: Text(
                      "Tidak",
                      style: GoogleFonts.cabin(fontSize: 14),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
