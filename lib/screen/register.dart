import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:vgo/model/register.dart';
import 'package:vgo/screen/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController nama = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController nomor = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  String _radioButton;
  List<String> _status = ["Pedagang", "Customer"];

  Future<ModelRegister> _futureAlbum;
  ModelRegister modelRegister;
  Future<ModelRegister> createAlbum(String user, String pass, String nama, String type, String email, String nomor, String action) async {
//  const Map<String, Object> responseBody = {"isSuccess": false, "errormsg": "Password Atau User Salah!"};

    final response = await http.post(
      'http://34.101.225.83/api-register.php',
      body: jsonEncode(<String, dynamic>{
        'Username': user,
        'Password': pass,
        'Nama': nama,
        'TypeUser': type,
        'Email': email,
        'NomorTlp': nomor,
        'Action': action
      }),
    );

    if (response.statusCode == 200) {
//   if (responseBody["isSuccess"] == true) {
      print(response.body);
      modelRegister = ModelRegister.fromJson(json.decode(response.body));
      return modelRegister;
    } else {
      print('salah 1');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/register.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
                child: (_futureAlbum == null)
                    ? Form(
                  key: _formKey,
//                autovalidate: _autoValidate,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 100),
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset('images/logo.png')),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            height: 55,
                            width: 240,
                            child: TextFormField(
                              controller: username,
                              style: TextStyle(fontSize: 14),
                              validator: (inputpass) {
                                if (inputpass.isEmpty) {
                                  return 'Username tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (String inputpass) {
                                print(inputpass);
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Masukkan Username anda',
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            height: 55,
                            width: 240,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14),
                              controller: password,
                              validator: (inputpass) {
                                if (inputpass.isEmpty) {
                                  return 'password tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              onSaved: (String inputpass) {
                                print(inputpass);
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Masukkan Password anda',
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            height: 55,
                            width: 240,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14),
                              controller: nama,
                              validator: (inputpass) {
                                if (inputpass.isEmpty) {
                                  return 'Nama tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              onSaved: (String inputpass) {
                                print(inputpass);
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Masukkan Nama anda',
                                  labelText: 'Nama',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                              height: 55,
                              width: 260,
                              child: RadioGroup<String>.builder(
                                direction: Axis.horizontal,
                                groupValue: _radioButton,
                                onChanged: (value) => setState(() {
                                  _radioButton = value;
                                }),
                                items: _status,
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item,
                                ),
                              )
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            height: 55,
                            width: 240,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14),
                              controller: email,
                              validator: (inputpass) {
                                if (inputpass.isEmpty) {
                                  return 'Email tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              onSaved: (String inputpass) {
                                print(inputpass);
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Masukkan Email anda',
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            height: 55,
                            width: 240,
                            child: TextFormField(
                              style: TextStyle(fontSize: 14),
                              controller: nomor,
                              validator: (inputpass) {
                                if (inputpass.isEmpty) {
                                  return 'Nomor Telepon tidak boleh kosong';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              onSaved: (String inputpass) {
                                print(inputpass);
                              },
                              decoration: InputDecoration(

                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Masukkan Nomor Telepon Anda',
                                  labelText: 'Nomor Telepon',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30)),
                                child: Text('Daftar',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                color: Colors.pink,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
//                                      _formKey.currentState.save();
//
//                                      SharedPreferences prefs =
//                                          await SharedPreferences.getInstance();
//                                      prefs.setBool('login', true);
                                    setState(() {
                                      _futureAlbum = createAlbum(
                                          username.text,
                                          password.text,
                                          nama.text,
                                          _radioButton.toString(),
                                          email.text,
                                          nomor.text,
                                          'Add');
                                    });
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Sudah punya akun ?"),
                              Text(' '),
                              GestureDetector(
                                onTap: () {
                                  var route = MaterialPageRoute(
                                      builder: (context) => Login());
                                  Navigator.push(context, route);
                                },
                                child: Text(
                                  'Masuk disini',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : FutureBuilder<ModelRegister>(
                  future: _futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Login();
                    } else if (snapshot.hasError) {
                      return AlertDialog(
                        title: Center(child: Text('MAAF')),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                'Username atau Password Salah. Silahkan Coba Lagi',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Coba Lagi'),
                            onPressed: () {
                              var route = CupertinoPageRoute(
                                  builder: (context) => Login());
                              Navigator.push(context, route);
                            },
                          ),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),

            ),
          ],
        )
    );
  }
}
