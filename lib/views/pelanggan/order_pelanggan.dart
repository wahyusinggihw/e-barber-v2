// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:e_barber_v2/models/user_model.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../views/bottombar.dart';

class OrderPelanggan extends StatefulWidget {
  const OrderPelanggan({Key? key}) : super(key: key);

  @override
  _OrderPelangganState createState() => _OrderPelangganState();
}

class _OrderPelangganState extends State<OrderPelanggan> {
  @override
  Widget build(BuildContext context) {
    // var simpanDataPotongan = SimpanDataPotongan();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final _potongans = FirebaseFirestore.instance.collection('jenis_potongan');

    // final RambutModel r
    // final rambutProvider = Provider.of<ModelRambut>(context, listen: false);
    // final RambutModel rambutModel = RambutModel();
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('jenis_potongan')
        .doc(simpanDataBarbers.uid)
        .collection('potongans')
        .snapshots();

    UserModel getUser = UserModel();
    UserModel createOrder = UserModel();
//   }
    // Widget bottomNavBar = BottomBar();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          splashRadius: 25,
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Text("<", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  "Order",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(simpanDataOrder.photoUrl),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 1),
                    child: Text(
                      simpanDataOrder.namaPotongan,
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Rp. " + simpanDataOrder.harga,
                    style: GoogleFonts.inter(fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Data Pelanggan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          thickness: 1,
                          height: 10,
                          color: Color(0xff20639B),
                        ),
                        Container(
                          child: FutureBuilder(
                            future: getUser.getUser(
                                field: 'first_name', collection: 'pelanggans'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                simpanDataOrder.namaPelanggan =
                                    snapshot.data.toString();
                                return Text(snapshot.data.toString());
                              } else {
                                return Text("");
                              }
                            },
                          ),
                        ),
                        Container(
                          child: FutureBuilder(
                            future: getUser.getUser(
                                field: 'alamat', collection: 'pelanggans'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                simpanDataOrder.alamat =
                                    snapshot.data.toString();
                                return Text(snapshot.data.toString());
                              } else {
                                return Text("");
                              }
                            },
                          ),
                        ),
                        Container(
                          child: FutureBuilder(
                            future: getUser.getUser(
                                field: 'no_hp', collection: 'pelanggans'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data.toString());
                              } else {
                                return Text("");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      heroTag: 'order',
                      backgroundColor: const Color(0xff20639B),
                      onPressed: () async {
                        final message = await createOrder.createOrder(
                          barberId: simpanDataBarbers.uid,
                          namaBarber: simpanDataBarbers.firstname,
                          namaPelanggan: simpanDataOrder.namaPelanggan,
                          alamatPelanggan: simpanDataOrder.alamat,
                          hargaPotongan: simpanDataOrder.harga,
                          idnama: simpanDataOrder.id,
                          namaPotongan: simpanDataOrder.namaPotongan,
                          photoUrl: simpanDataOrder.photoUrl,
                        );

                        if (message!.contains('Success')) {
                          // print('success');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text(
                                'Order berhasil, cek halaman status order'),
                          ));
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(message),
                            ),
                          );
                        }

                        // if (_formKey.currentState!.validate()) {
                        //   final message = await barbermanModel.createModelRambut(
                        //       idnama: _idController.text,
                        //       photoUrl: 'https://reqres.in/img/faces/2-image.jpg',
                        //       namaPotongan: _namaController.text,
                        //       hargaPotongan: _hargaController.text);

                        //   if (message!.contains('Success')) {
                        //     print('success');
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       backgroundColor: Colors.blue,
                        //       content: Text('Data berhasil ditambah'),
                        //     ));
                        //     Navigator.pop(context);
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         backgroundColor: Colors.red,
                        //         content: Text(message),
                        //       ),
                        //     );
                        //   }
                        // }
                      },
                      label: const Text("Order"),
                    ),
                  )
                ],
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
