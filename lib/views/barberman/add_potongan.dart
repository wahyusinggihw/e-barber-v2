import 'package:e_barber_v2/models/barberman_model.dart';
import 'package:flutter/material.dart';
import '../../provider/barberman_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPotongan extends StatefulWidget {
  const AddPotongan({Key? key}) : super(key: key);

  @override
  State<AddPotongan> createState() => _AddPotonganState();
}

class _AddPotonganState extends State<AddPotongan> {
  final TextEditingController _photoUrlController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<ModelRambut>(context, listen: false);
    final ImagePicker imagePicker = ImagePicker();
    final _formKey = GlobalKey<FormState>();
    BarbermanModel barbermanModel = BarbermanModel();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Text("<", style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ListView(children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: const Text(
                "Add Model",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://www.gravatar.com/avatar/?d=mp'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    top: 90,
                    child: IconButton(
                      splashColor: Colors.white,
                      splashRadius: 5,
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo_rounded),
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Column(children: [
                      TextFormField(
                        controller: _namaController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Nama Model",
                          labelText: "Nama",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'wajib diisi!';
                          }
                          // formData.nama = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _hargaController,
                        decoration: InputDecoration(
                          hintText: "Masukkan harga ",
                          labelText: "Harga",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "wajib diisi!";
                          }
                          // formData.jk = value;
                          return null;
                        },
                      ),
                    ]),
                  )),
              SizedBox(height: 100),
              FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                heroTag: 'addpotongan',
                backgroundColor: const Color(0xff20639B),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final message = await barbermanModel.createModelRambut(
                        photoUrl: 'https://reqres.in/img/faces/2-image.jpg',
                        namaPotongan: _namaController.text,
                        hargaPotongan: _hargaController.text);

                    if (message!.contains('Success')) {
                      print('success');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text('Berhasil ditambah'),
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
                  }
                },
                label: const Text("add"),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
