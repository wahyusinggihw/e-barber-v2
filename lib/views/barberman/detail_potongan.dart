import 'package:e_barber_v2/models/barberman_model.dart';
import 'package:e_barber_v2/models/models.dart';
import 'package:flutter/material.dart';
import '../../provider/barberman_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class DetailPotongan extends StatefulWidget {
  const DetailPotongan({Key? key}) : super(key: key);

  @override
  State<DetailPotongan> createState() => _DetailPotonganState();
}

class _DetailPotonganState extends State<DetailPotongan> {
  // var simpanDataPotongan = SimpanDataPotongan();
  final TextEditingController _photoUrlController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () async {
          final message = await barbermanModel.deleteModelRambut(
              idnama: simpanDataPotongan.id);
          if (message!.contains('Success')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('Data berhasil dihapus'),
              ),
            );
            Navigator.pop(context);
          }
        },
        backgroundColor: Color(0xff20639B),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Column(children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(simpanDataPotongan.photoUrl),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          // Positioned(
                          //   top: 80,
                          //   child: IconButton(
                          //     splashColor: Colors.white,
                          //     splashRadius: 5,
                          //     onPressed: () {},
                          //     icon: Icon(Icons.add_a_photo_rounded),
                          //     color: Colors.white,
                          //   ),
                          // )
                        ],
                      ),
                      TextFormField(
                        readOnly: true,
                        enabled: false,
                        // controller: _namaController,
                        initialValue: simpanDataPotongan.id,
                        decoration: InputDecoration(
                          hintText: "id-model",
                          labelText: "ID",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'wajib diisi!';
                          }
                          simpanDataPotongan.id = value;
                          // formData.nama = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        // controller: _namaController,
                        initialValue: simpanDataPotongan.nama,
                        decoration: InputDecoration(
                          hintText: "Nama",
                          labelText: "Nama",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'wajib diisi!';
                          }
                          simpanDataPotongan.nama = value;
                          // formData.nama = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        // controller: _hargaController,
                        initialValue: simpanDataPotongan.harga,
                        decoration: InputDecoration(
                          hintText: "Masukkan harga ",
                          labelText: "Harga",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "wajib diisi!";
                          }
                          simpanDataPotongan.harga = value;
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
                  // print(message);
                  if (_formKey.currentState!.validate()) {
                    final message = await barbermanModel.updateModelRambut(
                        idnama: simpanDataPotongan.id,
                        namaPotongan: simpanDataPotongan.nama,
                        hargaPotongan: simpanDataPotongan.harga,
                        photoUrl: '');
                    //   final message = await barbermanModel.createModelRambut(
                    //       photoUrl: 'https://reqres.in/img/faces/2-image.jpg',
                    //       namaPotongan: _namaController.text,
                    //       hargaPotongan: _hargaController.text);

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
                label: const Text("update"),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
