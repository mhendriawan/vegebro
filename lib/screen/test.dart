import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vgo/model/produk.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  List<Datum> listBarang;
  bool loading = true;

  createBarang() async {
    final http.Response response = await http.post(
      'http://34.101.225.83/api-barang.php',
      body: jsonEncode(<String, dynamic>{
        'Action': 'AllProduct'
      }),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      ModelProduk dataBarang = ModelProduk.fromJson(json);

      setState(() {
        listBarang = dataBarang.data;
        loading = false;
      });
    } else {
      print("salah");
    }
  }

  @override
  void initState() {
    super.initState();
    createBarang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Container(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: listBarang.length,
            itemBuilder: (context, index) {
              Datum itemBarang = listBarang[index];
              return GestureDetector(
                onTap: () {

                },
                child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: 120,
                      width: 380,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 95,
                              width: 100,
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundImage: NetworkImage(
                                    'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/6/7/f104dc8e-a1ff-475c-9b2e-fbbb190e7bb1.jpg'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 95,
                              width: 160,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(itemBarang.namaBrg,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.bold)),
                                  Text("(ikat)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.bold)),
                                  Text("Bayam harga satu ikat",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey)),
                                  SizedBox(height: 10),
                                  Text("Rp. 2.000",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8, left: 8),
                            child: Container(
                                height: 95,
                                width: 65,
                                child: Icon(Icons.check_circle,
                                    color: Colors.pink)),
                          )
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
