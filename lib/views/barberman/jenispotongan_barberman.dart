// import 'package:e_barber/barberman/bottombar_barberman.dart';
import 'package:e_barber_v2/provider/auth_provider.dart';
import 'package:e_barber_v2/provider/barberman_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPotongan extends StatefulWidget {
  const ListPotongan({Key? key}) : super(key: key);

  @override
  _ListPotonganState createState() => _ListPotonganState();
}

class _ListPotonganState extends State<ListPotongan> {
  @override
  Widget build(BuildContext context) {
    // final crudModelRambut = Provider.of<ModelRambut>(context, listen: false);

    return ChangeNotifierProvider(
      create: (context) => ModelRambut(),
      // builder: (context, child``),
      child: Scaffold(
        body: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
            children: <Widget>[
              Center(
                child: Provider<ModelRambut>(
                  create: (context) => ModelRambut(),
                  child: Column(
                    children: [Text("1"), Text("1"), Text("1")],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
