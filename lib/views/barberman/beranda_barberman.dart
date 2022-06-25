import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_barber_v2/models/models.dart';

class BerandaBarberman extends StatefulWidget {
  const BerandaBarberman({Key? key}) : super(key: key);

  @override
  _BerandaBarbermanState createState() => _BerandaBarbermanState();
}

class _BerandaBarbermanState extends State<BerandaBarberman> {
  @override
  Widget build(BuildContext context) {
    UserModel getSaldo = UserModel();
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: const Text(
                      "Beranda | Barberman",
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
                        fit: BoxFit.fill,
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
                                              snapshot.data.toString(),
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
