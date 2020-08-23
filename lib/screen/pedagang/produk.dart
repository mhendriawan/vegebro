import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rupiah/rupiah.dart';
import 'package:vgo/model/produk.dart';
import 'package:vgo/screen/pedagang/home_pedagang.dart';
import 'package:vgo/screen/pedagang/tambah_produk.dart';
import 'package:http/http.dart' as http;
import 'package:vgo/screen/test.dart';

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {

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

  deleteBarang(String did) async {
    final http.Response response = await http.delete(
      'http://34.101.225.83/api-barang.php',
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

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 43),
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
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Text(
                      "Produk",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 200,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("15",
                              style: GoogleFonts.blackHanSans(
                                fontSize: 40,
                                color: Colors.white
                              )),
                          Text("Sayur",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("7",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 40,
                                  color: Colors.white
                              )),
                          Text("Buah",
                              style:
                              TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("3",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 40,
                                  color: Colors.white
                              )),
                          Text("Daging",
                              style:
                              TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("34",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 40,
                                  color: Colors.white
                              )),
                          Text("Lain-lain",
                              style:
                              TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 7),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    height: 45,
                    child: TextFormField(
                      autofocus: false,
                      controller: _controller,
                      onSaved: (String quicksearch) {
                        print(quicksearch);
                      },
                      onFieldSubmitted: (String text) {},
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Cari Barang',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: loading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                          itemCount: listBarang.length,
                          itemBuilder: (context, index) {
                            Datum itemBarang = listBarang[index];
                            return GestureDetector(
                              onTap: () {
                                var route = MaterialPageRoute(
                                    builder: (context) => TambahProduk());
                                Navigator.push(context, route);
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
                                                Text(itemBarang.satuan,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text(itemBarang.catatan,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                                SizedBox(height: 10),
                                                Text(rupiah(itemBarang.harga),
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
                                              child: IconButton(
                                                onPressed: (){
                                                  setState(() {
                                                    deleteBarang(itemBarang.did.toString());
                                                  });
                                                },
                                                icon: Icon(Icons.delete,
                                                    color: Colors.pink)),
                                              ),
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TambahProduk()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
Widget _filterProduk() {
  return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 43),
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Urutkan berdasarkan",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {},
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Sayuran',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal)),
                                  ))),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {},
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Buah-buahan',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal)),
                                  ))),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {},
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Ikan dan Daging',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal)),
                                  ))),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {},
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Lain-lain',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal)),
                                  ))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ));
}
