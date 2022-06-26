// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../views/bottombar.dart';

class ListBarber extends StatefulWidget {
  const ListBarber({Key? key}) : super(key: key);

  @override
  _ListBarberState createState() => _ListBarberState();
}

class _ListBarberState extends State<ListBarber> {
  final _loginKey = GlobalKey<_ListBarberState>();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final Stream<QuerySnapshot> _barbersStream =
        FirebaseFirestore.instance.collection('barbers').snapshots();

    Widget bottomNavBar = BottomBar();

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30, top: 25),
            child: const Text(
              "Daftar Barbershop",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              // initialData: _productss.snapshots(),
              stream: _barbersStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2),
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
                            return InkWell(
                              onTap: () {
                                // simpanDataPotongan.id =
                                //     documentSnapshot['idnama'];

                                simpanDataBarbers.uid = documentSnapshot['uid'];
                                simpanDataBarbers.firstname =
                                    documentSnapshot['first_name'];

                                simpanDataBarbers.lastname =
                                    documentSnapshot['last_name'];

                                // simpanDataPotongan.photoUrl =
                                //     documentSnapshot[
                                //         'https://reqres.in/img/faces/2-image.jpg'];
                                Navigator.pushNamed(context, '/detail-barber');
                              },
                              child: ListTile(
                                // isThreeLine: true,
                                leading: Container(
                                  width: 47.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://reqres.in/img/faces/2-image.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                title: Text(documentSnapshot['first_name'] +
                                    ' ' +
                                    documentSnapshot['last_name']),
                                subtitle: Text(documentSnapshot['alamat']),
                              ),
                            );
                            // return Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: Column(
                            //     children: [
                            //       InkWell(
                            //         borderRadius: BorderRadius.circular(125),
                            //         onTap: () {
                            //           // simpanDataPotongan.id =
                            //           //     documentSnapshot['idnama'];

                            //           simpanDataBarbers.uid =
                            //               documentSnapshot['uid'];
                            //           simpanDataBarbers.nama =
                            //               documentSnapshot['first_name'];
                            //           documentSnapshot['last_name'];

                            //           // simpanDataPotongan.photoUrl =
                            //           //     documentSnapshot[
                            //           //         'https://reqres.in/img/faces/2-image.jpg'];
                            //           Navigator.pushNamed(
                            //               context, '/detail-barber');
                            //         },
                            //         child: Container(
                            //           height: 120.0,
                            //           width: 120.0,
                            //           decoration: BoxDecoration(
                            //             image: DecorationImage(
                            //               image: NetworkImage(
                            //                   'https://reqres.in/img/faces/2-image.jpg'),
                            //               fit: BoxFit.fill,
                            //             ),
                            //             shape: BoxShape.circle,
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(
                            //             bottom: 1, top: 1),
                            //         child: Text(
                            //           documentSnapshot['first_name'],
                            //           style: GoogleFonts.inter(
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //       Text(
                            //         documentSnapshot['last_name'],
                            //         style: GoogleFonts.inter(
                            //             fontWeight: FontWeight.normal),
                            //       ),
                            //     ],
                            //   ),
                            // );
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
