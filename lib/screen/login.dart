import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgo/model/login.dart';
import 'package:vgo/screen/customer/home_pembeli.dart';
import 'package:vgo/screen/pedagang/home_pedagang.dart';
import 'package:vgo/screen/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  cekSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool sesiLogin = prefs.getBool('login') ?? false;

    if (sesiLogin == true) {
      print('session login true');
      var route = MaterialPageRoute(builder: (context) => HomePedagang());
      Navigator.pushReplacement(context, route);
    } else {
      print('session login false');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cekSession();
  }

  Future<ModelLogin> _futureAlbum;
  ModelLogin modelLogin;
  Future<ModelLogin> createAlbum(String user, String pass) async {
    final http.Response response = await http.post(
      'http://34.101.225.83/api-login.php',
      body: jsonEncode(<String, dynamic>{
        'username': user,
        'userpassword': pass,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      modelLogin = ModelLogin.fromJson(json.decode(response.body));
      return modelLogin;
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
                    image: AssetImage("images/login.png"), fit: BoxFit.cover),
              ),
            ),
            Container(
              alignment: Alignment.center,
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
                                height: 50.0,
                              ),
                              Container(
                                height: 55,
                                width: 260,
                                color: Colors.white,
                                child: TextFormField(
                                  controller: user,
                                  validator: (inputuser) {
                                    if (inputuser.isEmpty) {
                                      return 'username tidak boleh kosong';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (String inputuser) {
                                    print(inputuser);
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Masukkan Username Anda',
                                      labelText: 'Username',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                height: 55,
                                width: 260,
                                color: Colors.white,
                                child: TextFormField(
                                  controller: pass,
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
                                      hintText: 'Masukkan Password anda',
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 8),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Forgot Password ?',
                                    style: TextStyle(color: Colors.blue),
                                  ),
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
                                    child: Text('Masuk',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    color: Colors.pink,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();

                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setBool('login', true);

                                        setState(() {
                                          _futureAlbum =
                                              createAlbum(user.text, pass.text);
                                        });
                                      }
                                    }),
                              ),
                              SizedBox(
                                height: 150,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Tidak punya akun ?"),
                                  Text(' '),
                                  GestureDetector(
                                    onTap: () {
                                      var route = MaterialPageRoute(
                                          builder: (context) => Register());
                                      Navigator.push(context, route);
                                    },
                                    child: Text(
                                      'Daftar disini',
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
                  : FutureBuilder<ModelLogin>(
                      future: _futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HomePembeli();
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
        ));
  }
}
