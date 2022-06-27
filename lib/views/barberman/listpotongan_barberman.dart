// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListPotongan extends StatefulWidget {
  const ListPotongan({Key? key}) : super(key: key);

  @override
  _ListPotonganState createState() => _ListPotonganState();
}

class _ListPotonganState extends State<ListPotongan> {
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
        .doc(_auth.currentUser!.uid)
        .collection('potongans')
        .snapshots();
//   }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // foregroundColor: Colors.white,
      ),
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
            padding: const EdgeInsets.only(bottom: 30),
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
                                      simpanDataPotongan.photoUrl =
                                          documentSnapshot['photo_url'];
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
                                              documentSnapshot['photo_url']),
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
