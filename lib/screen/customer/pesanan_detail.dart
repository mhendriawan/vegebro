import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PesananDetailPembeli extends StatefulWidget {
  @override
  _PesananDetailPembeliState createState() => _PesananDetailPembeliState();
}

class _PesananDetailPembeliState extends State<PesananDetailPembeli> {
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
                      "Daftar Belanja",
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
          Container(
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Abang Sayur"),
                            Text("Bang Hendri",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.bold)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text("Detail Pesanan"),
                        ),
                        Container(
                            height: 330,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        child: Image.network(
                                            'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/6/7/f104dc8e-a1ff-475c-9b2e-fbbb190e7bb1.jpg'),
                                      ),
                                      SizedBox(width: 7),
                                      Container(
                                        width: 180,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Bayam Merah",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            SizedBox(height: 10),
                                            Text("Rp. 2.000 / ikat",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            Text("qty : 5",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            Text("Bayam yang ada hijau daunnya",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 7),
                                      Container(
                                        alignment: Alignment.topCenter,
                                        child: IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: (){
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible: false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return CupertinoAlertDialog(
                                                  title: Text('Hapus Barang ?'),
                                                  actions: <Widget>[
                                                    CupertinoDialogAction(
                                                      child: Text('Hapus'),
                                                      onPressed: () {

                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      child: Text('Tidak'),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Estimasi Harga",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("Rp. 10.000",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 230),
                          child: Container(
                            height: 55,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  height: 40,
                                  width: 80,
                                  child: Card(
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            6.0)),
                                    child: Center(
                                        child: Text(
                                          "Pesan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
