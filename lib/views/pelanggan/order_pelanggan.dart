// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderPelanggan extends StatefulWidget {
  const OrderPelanggan({Key? key}) : super(key: key);

  @override
  _OrderPelangganState createState() => _OrderPelangganState();
}

class _OrderPelangganState extends State<OrderPelanggan> {
  final _loginKey = GlobalKey<_OrderPelangganState>();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('jenis_potongan')
        .doc()
        .collection('potongans')
        .snapshots();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/add-potongan');
        },
        backgroundColor: Color(0xff20639B),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30, top: 25),
            child: const Text(
              "Daftar Model",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              // initialData: _productss.snapshots(),
              stream: _usersStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];

                      switch (streamSnapshot.connectionState) {
                        case ConnectionState.none:
                          return Text("No Connections");
                        case ConnectionState.waiting:
                        // return CircularProgressIndicator();
                        case ConnectionState.active:
                        case ConnectionState.done:
                          if (streamSnapshot.data!.docs.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(125),
                                    onTap: () {
                                      simpanDataPotongan.id =
                                          documentSnapshot['idnama'];
                                      simpanDataPotongan.harga =
                                          documentSnapshot['harga'];
                                      simpanDataPotongan.nama =
                                          documentSnapshot['nama'];
                                      // simpanDataPotongan.photoUrl =
                                      //     documentSnapshot[
                                      //         'https://reqres.in/img/faces/2-image.jpg'];
                                      Navigator.pushNamed(
                                          context, '/detail-potongan');
                                    },
                                    child: Container(
                                      height: 120.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://reqres.in/img/faces/2-image.jpg'),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 1, top: 1),
                                    child: Text(
                                      documentSnapshot['nama'],
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "Rp. " + documentSnapshot['harga'],
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        default:
                          break;
                      }
                      return CircularProgressIndicator();
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
