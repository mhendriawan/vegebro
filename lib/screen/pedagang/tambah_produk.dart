import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vgo/model/produk.dart';
import 'package:vgo/screen/pedagang/home_pedagang.dart';
import 'package:http/http.dart' as http;

class TambahProduk extends StatefulWidget {

  @override
  _TambahProdukState createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {

  Future<ModelProduk> _futureAlbum;
  ModelProduk modelProduk;
  Future<ModelProduk> createAlbum(String user, String pass, String nama, String type, String nomor, String action) async {
//  const Map<String, Object> responseBody = {"isSuccess": false, "errormsg": "Password Atau User Salah!"};

    final response = await http.post(
      'http://34.101.225.83/api-barang.php',
      body: jsonEncode(<String, dynamic>{
        'NamaBrg': user,
        'Satuan': pass,
        'Kategori': nama,
        'Harga': type,
        'Images': '',
        'DID': '',
        'Username': nomor,
        'Action': action
      }),
    );

    if (response.statusCode == 200) {
//   if (responseBody["isSuccess"] == true) {
      print(response.body);
      modelProduk = ModelProduk.fromJson(json.decode(response.body));
      return modelProduk;
    } else {
      print('salah 1');
    }
  }

  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerKategori = TextEditingController();
  final TextEditingController _controllerSatuan = TextEditingController();
  final TextEditingController _controllerHarga = TextEditingController();
  final TextEditingController _controllerCatatan = TextEditingController();

  File _image;
  Future getImage(ImageSource media) async {
    var img = await ImagePicker.pickImage(source: media);
    setState(() {
      _image = img;
    });
  }
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top :43),
            child: Container(
              alignment: Alignment.topRight,
              child: Image.asset("images/menu.png"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Produk",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                  )
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.grey[100],
              ),
              height: 600,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: _image == null
                            ? GestureDetector(
                            onTap: () {
                              myAlert();
                            },
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  color: Colors.grey,
                                  height: 100,
                                  width: 100,
                                ),
                                Container(
                                  color: Colors.blueGrey,
                                  child: Icon(Icons.edit, size: 20,),
                                )
                              ],
                            )
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _image,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 80,
                                child: Text("Nama", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: 220,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        cursorColor: Colors.pink,
                                        controller: _controllerNama,
                                        validator: (inputuser) {
                                          if (inputuser.isEmpty) {
                                            return 'Nama Barang tidak boleh kosong';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (String inputuser) {
                                          print(inputuser);
                                        },

                                        onFieldSubmitted: (String text) {
                                          setState(() {
                                            _futureAlbum = createAlbum(
                                                _controllerNama.text,
                                                _controllerKategori.text,
                                                _controllerSatuan.text,
                                                _controllerHarga.text,
                                                _controllerCatatan.text,
                                                'Update');
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 80,
                                child: Text("Satuan", style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: 220,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  cursorColor: Colors.pink,
                                  controller: _controllerSatuan,
                                  validator: (inputuser) {
                                    if (inputuser.isEmpty) {
                                      return 'Satuan tidak boleh kosong';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (String inputuser) {
                                    print(inputuser);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 80,
                                child: Text("Kategori", style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: 220,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  cursorColor: Colors.pink,
                                  controller: _controllerKategori,
                                  validator: (inputuser) {
                                    if (inputuser.isEmpty) {
                                      return 'Kategori tidak boleh kosong';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (String inputuser) {
                                    print(inputuser);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 80,
                                child: Text("Harga", style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: 220,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  cursorColor: Colors.pink,
                                  controller: _controllerHarga,
                                  validator: (inputuser) {
                                    if (inputuser.isEmpty) {
                                      return 'Harga tidak boleh kosong';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (String inputuser) {
                                    print(inputuser);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: 80,
                                child: Text("Catatan", style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 60,
                              width: 220,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 5),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  cursorColor: Colors.pink,
                                  controller: _controllerCatatan,
                                  validator: (inputuser) {
                                    if (inputuser.isEmpty) {
                                      return 'Catatan tidak boleh kosong';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (String inputuser) {
                                    print(inputuser);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  child: Text('Batal',
                                      style: TextStyle(color: Colors.white, fontSize: 13)),
                                  color: Colors.red,
                                  onPressed: () async {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => HomePedagang()));
                                  }),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  child: Text('Tambah',
                                      style: TextStyle(color: Colors.white, fontSize: 13)),
                                  color: Colors.red,
                                  onPressed: () async {

//                                      _formKey.currentState.save();
//
//                                      SharedPreferences prefs =
//                                          await SharedPreferences.getInstance();
//                                      prefs.setBool('login', true);
                                      setState(() {
                                        _futureAlbum = createAlbum(
                                            _controllerNama.text,
                                            _controllerKategori.text,
                                            _controllerSatuan.text,
                                            _controllerHarga.text,
                                            _controllerCatatan.text,
                                            'Add');
                                      });
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => HomePedagang()));
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
