// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:e_barber_v2/models/user_model.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StatusOrderPelanggan extends StatefulWidget {
  const StatusOrderPelanggan({Key? key}) : super(key: key);

  @override
  _StatusOrderPelangganState createState() => _StatusOrderPelangganState();
}

class _StatusOrderPelangganState extends State<StatusOrderPelanggan> {
  @override
  Widget build(BuildContext context) {
    // var simpanDataPotongan = SimpanDataPotongan();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final _potongans = FirebaseFirestore.instance.collection('jenis_potongan');

    // final RambutModel r
    // final rambutProvider = Provider.of<ModelRambut>(context, listen: false);
    // final RambutModel rambutModel = RambutModel();
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('order')
        .where('uid', isEqualTo: _auth.currentUser!.uid)
        .snapshots();

    UserModel getUser = UserModel();
    UserModel doneOrder = UserModel();
//   }
    // Widget bottomNavBar = BottomBar();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  "Status Order",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                // initialData: _productss.snapshots(),
                stream: _usersStream,
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
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
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 120.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  documentSnapshot[
                                                      'photo_url']),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 1, top: 1),
                                          child: Text(
                                            documentSnapshot['nama_potongan'],
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "Rp. " + documentSnapshot['harga'],
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          documentSnapshot['status'],
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: FloatingActionButton.extended(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            heroTag: 'order',
                                            backgroundColor:
                                                const Color(0xff20639B),
                                            onPressed: () async {
                                              final message =
                                                  await doneOrder.doneOrder();

                                              if (message!
                                                  .contains('Success')) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.blue,
                                                  content: Text(
                                                      'Order berhasil diselesaikan'),
                                                ));
                                              }
                                              // final message = await createOrder.createOrder(
                                              //   barberId: simpanDataBarbers.uid,
                                              //   namaBarber: simpanDataBarbers.firstname,
                                              //   namaPelanggan: simpanDataOrder.namaPelanggan,
                                              //   alamatPelanggan: simpanDataOrder.alamat,
                                              //   hargaPotongan: simpanDataOrder.harga,
                                              //   idnama: simpanDataOrder.id,
                                              //   namaPotongan: simpanDataOrder.namaPotongan,
                                              // );

                                              // if (message!.contains('Success')) {
                                              //   print('success');
                                              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              //     backgroundColor: Colors.blue,
                                              //     content: Text(
                                              //         'Order berhasil, cek halaman status order'),
                                              //   ));
                                              //   Navigator.pop(context);
                                              // } else {
                                              //   ScaffoldMessenger.of(context).showSnackBar(
                                              //     SnackBar(
                                              //       backgroundColor: Colors.red,
                                              //       content: Text(message),
                                              //     ),
                                              // );

                                              //
                                            },
                                            label: const Text("Order Selesai"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
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
      ),
    );
    // body: Center(
    //   child: ListView(
    //     padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
    //     children: <Widget>[
    //       Center(
    //         child: Provider<ModelRambut>(
    //           create: (context) => ModelRambut(),
    //           child: Column(
    //             children: [Text("1"), Text("1"), Text("1")],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // ),
  }
}
