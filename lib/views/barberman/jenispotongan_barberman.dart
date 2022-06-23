// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:e_barber_v2/models/barberman_model.dart';
import 'package:e_barber_v2/provider/auth_provider.dart';
import 'package:e_barber_v2/provider/barberman_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPotongan extends StatefulWidget {
  const ListPotongan({Key? key}) : super(key: key);

  @override
  _ListPotonganState createState() => _ListPotonganState();
}

class _ListPotonganState extends State<ListPotongan> {
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('products');
  // final RambutModel r

  @override
  Widget build(BuildContext context) {
    // final rambutProvider = Provider.of<ModelRambut>(context, listen: false);
    // final RambutModel rambutModel = RambutModel();
    return Scaffold(
      body: StreamBuilder(
        // initialData: _productss.snapshots(),
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                switch (streamSnapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("No Connections");
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return streamSnapshot.data!.docs.length > 0
                        ? Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(documentSnapshot['name']),
                              subtitle:
                                  Text(documentSnapshot['price'].toString()),
                              trailing: SizedBox(
                                  width: 100,
                                  child: Row(children: [
                                    IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {}
                                        // _createOrUpdate(documentSnapshot)),
                                        ),
                                    IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {}
                                        // _deleteProduct(documentSnapshot.id)),
                                        )
                                  ])),
                            ),
                          )
                        : Center(child: CircularProgressIndicator());
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
