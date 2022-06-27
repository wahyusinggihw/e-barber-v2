import 'package:e_barber_v2/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BerandaPelanggan extends StatefulWidget {
  const BerandaPelanggan({Key? key}) : super(key: key);

  @override
  _BerandaPelangganState createState() => _BerandaPelangganState();
}

class _BerandaPelangganState extends State<BerandaPelanggan> {
  final datasets = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    UserModel getSaldo = UserModel();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // foregroundColor: Colors.white,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(left: 50, right: 50),
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: const Text(
                      "Beranda | Pelanggan",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: SizedBox(
                      height: 150,
                      width: 500,
                      child: Image.asset(
                        'assets/images/beranda2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: const Text(
                          "Aplikasi E-Barber ini diciptakan untuk mempermudah proses jual-beli jasa pemangkasan rambut. Dalam sekali sentuh, jasa yang anda inginkan akan tersedia.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              wordSpacing: 10,
                              height: 2))),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: SizedBox(
                          height: 150,
                          width: 500,
                          child: ColoredBox(
                            color: Color(0xff20639B),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Uang Digital",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, left: 20),
                                      child: FutureBuilder(
                                        future: getSaldo.getUser(
                                            field: 'saldo',
                                            collection: 'saldo'),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              'Rp. ' + snapshot.data.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24),
                                            );
                                          } else {
                                            return Text("");
                                          }
                                        },
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 20, right: 20),
                                            child: FloatingActionButton(
                                                backgroundColor:
                                                    Colors.blue.shade500,
                                                heroTag: "TopUp",
                                                onPressed: () {},
                                                child: Container(
                                                  child: Icon(Icons.add),
                                                )),
                                          )
                                        ]),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
