// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:e_barber_v2/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../views/bottombar.dart';

class OrderBarberman extends StatefulWidget {
  const OrderBarberman({Key? key}) : super(key: key);

  @override
  _OrderBarbermanState createState() => _OrderBarbermanState();
}

class _OrderBarbermanState extends State<OrderBarberman> {
  final _loginKey = GlobalKey<_OrderBarbermanState>();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final Stream<QuerySnapshot> _barbersStream = FirebaseFirestore.instance
        .collection('order')
        .where('id_barber', isEqualTo: _auth.currentUser!.uid)
        .snapshots();

    UserModel updateStatus = UserModel();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: const Text(
              "Daftar Pesanan",
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
                            return ListTile(
                              isThreeLine: true,
                              leading: Container(
                                width: 47.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        documentSnapshot['photo_url']),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(documentSnapshot['nama_pelanggan']),
                              subtitle: Text(
                                documentSnapshot['nama_potongan'] +
                                    ', ' +
                                    'Rp. ' +
                                    documentSnapshot['harga'] +
                                    '\n' +
                                    documentSnapshot['alamat_pelanggan'],
                              ),
                              trailing: Wrap(
                                spacing: 12,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      final update = await updateStatus
                                          .statusOrder(status: 'diterima');

                                      print(update);
                                    },
                                    icon: Icon(Icons.check),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      updateStatus.statusOrder(
                                          status: 'ditolak');
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                ],
                              ),
                            );
                          } else if (streamSnapshot.data!.docs == null) {
                            return Center(child: CircularProgressIndicator());
                          }
                          break;
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
