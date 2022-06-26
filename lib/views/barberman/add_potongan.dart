import 'dart:io';

import 'package:e_barber_v2/models/barberman_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as p;

class AddPotongan extends StatefulWidget {
  const AddPotongan({Key? key}) : super(key: key);

  @override
  State<AddPotongan> createState() => _AddPotonganState();
}

class _AddPotonganState extends State<AddPotongan> {
  final TextEditingController _photoUrlController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = p.basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<ModelRambut>(context, listen: false);
    final ImagePicker imagePicker = ImagePicker();
    final _formKey = GlobalKey<FormState>();
    BarbermanModel barbermanModel = BarbermanModel();
    String imagePath = 'null';

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
                // alignment: Alignment.center,
                children: [
                  (_photo != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _photo!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: IconButton(
                            splashColor: Colors.white,
                            splashRadius: 5,
                            onPressed: () {
                              imgFromGallery();
                            },
                            icon: Icon(Icons.add_a_photo_rounded),
                            color: Colors.black,
                          ),
                        ),
                  // Positioned(
                  //   top: 20,
                  //   child: IconButton(
                  //     splashColor: Colors.white,
                  //     splashRadius: 5,
                  //     onPressed: () {
                  //       print('object');
                  //     },
                  //     icon: Icon(Icons.add_a_photo_rounded),
                  //     color: Colors.black,
                  //   ),
                  // ),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Column(children: [
                      TextFormField(
                        controller: _idController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "id",
                          labelText: "ID",
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
                        idnama: _idController.text,
                        photoUrl: 'https://reqres.in/img/faces/2-image.jpg',
                        namaPotongan: _namaController.text,
                        hargaPotongan: _hargaController.text);

                    if (message!.contains('Success')) {
                      print('success');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text('Data berhasil ditambah'),
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
