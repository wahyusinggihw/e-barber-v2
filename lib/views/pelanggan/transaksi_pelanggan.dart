import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:myapp/auth/auth_state.dart';
// import 'package:myapp/src/pages/index.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:map/map.dart';
// import 'package:latlng/latlng.dart';
// import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class PageTransaksi extends StatefulWidget {
  const PageTransaksi({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PageTransaksi> {
  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border(
                left: BorderSide(width: 0, color: Color(0xFF000000)),
                top: BorderSide(width: 0, color: Color(0xFF000000)),
                right: BorderSide(width: 0, color: Color(0xFF000000)),
                bottom: BorderSide(width: 0, color: Color(0xFF000000)),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 35,
                  ),
                  child: Text(r'''Transaksi''',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: const Color(0xFF2E2D38),
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        padding: EdgeInsets.zero,
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF20639B),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          ),
                          border: Border(
                            left:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                            top: BorderSide(width: 0, color: Color(0xFF000000)),
                            right:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                            bottom:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () async {
                              await Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageTransaksi(),
                                ),
                              );
                            },
                            child: Text(r'''Transaksi''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        padding: EdgeInsets.zero,
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          ),
                          border: Border(
                            left:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                            top: BorderSide(width: 0, color: Color(0xFF000000)),
                            right:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                            bottom:
                                BorderSide(width: 0, color: Color(0xFF000000)),
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () async {
                              // await Navigator.push<void>(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => PageHistoriTransaksi(),
                              //   ),
                              // );
                            },
                            child: Text(r'''Histori Transaksi''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 20,
                    bottom: 20,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(75.0),
                      topRight: Radius.circular(75.0),
                      bottomRight: Radius.circular(75.0),
                      bottomLeft: Radius.circular(75.0),
                    ),
                    child: Image.network(
                      r'''https://source.unsplash.com/random''',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(r'''Haircut''',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1),
                Text(r'''Rp. 25.000''',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 1),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  padding: EdgeInsets.zero,
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF20639B),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    border: Border(
                      left: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                          color: Color(0xFF000000)),
                      top: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                          color: Color(0xFF000000)),
                      right: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                          color: Color(0xFF000000)),
                      bottom: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                          color: Color(0xFF000000)),
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () async {
                        // await Navigator.push<void>(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PageTransaksiBerhasil(),
                        //   ),
                        // );
                      },
                      child: Text(r'''Bayar Pesanan''',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
