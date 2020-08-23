import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vgo/screen/pedagang/pesanan_detail.dart';

class Pesanan extends StatefulWidget {
  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        body: Stack(
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
                      padding: EdgeInsets.only(left: 20, top: 40),
                      child: Text(
                        "Pesanan",
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
                            Text("11",
                                style: GoogleFonts.blackHanSans(
                                    fontSize: 40,
                                    color: Colors.white
                                )),
                            Text("Masuk",
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
                            Text("Diproses",
                                style:
                                TextStyle(fontSize: 15, color: Colors.white))
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text("0",
                                style: GoogleFonts.blackHanSans(
                                    fontSize: 40,
                                    color: Colors.white
                                )),
                            Text("Ditolak",
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
                            Text("Selesai",
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.grey[100],
                    ),
                    height: 600,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(bottom: 5, right: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.filter_list),
                                  onPressed: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => _filterPesanan()));
                                  },
                                ),
                                Text("Filter",
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              var route = MaterialPageRoute(
                                  builder: (context) => DetailPesanan());
                              Navigator.push(context, route);
                            },
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              child: Container(
                                  height: 120,
                                  width: 380,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 95,
                                          width: 100,
                                          child: CircleAvatar(
                                            radius: 25.0,
                                            backgroundImage: AssetImage(
                                                'images/ibu1.jpg'),
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
                                              Text("Ny. Hendriawan",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              SizedBox(height: 7),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .shopping_cart,
                                                            color:
                                                            Colors.green),
                                                        Text("Pesanan",
                                                            style: TextStyle(
                                                                fontSize:
                                                                10)),
                                                        Text("Masuk",
                                                            style: TextStyle(
                                                                fontSize: 10))
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(Icons.list,
                                                            color:
                                                            Colors.grey),
                                                        Text("Pesanan",
                                                            style: TextStyle(
                                                                fontSize:
                                                                10)),
                                                        Text("Diproses",
                                                            style: TextStyle(
                                                                fontSize: 10))
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .directions_car,
                                                            color:
                                                            Colors.grey),
                                                        Text("Pesanan",
                                                            style: TextStyle(
                                                                fontSize:
                                                                10)),
                                                        Text("Diterima",
                                                            style: TextStyle(
                                                                fontSize: 10))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8, left: 8),
                                        child: Container(
                                            height: 30,
                                            width: 65,
                                            child: Card(
                                              color: Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      6.0)),
                                              child: Center(
                                                  child: Text(
                                                    "Selesai",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              child: Container(
                                  height: 120,
                                  width: 380,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 95,
                                          width: 100,
                                          child: CircleAvatar(
                                            radius: 25.0,
                                            backgroundImage: AssetImage(
                                                'images/ibu2.jpg'),
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
                                              Text("Ibu Tejo",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              SizedBox(height: 7),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .shopping_cart,
                                                            color:
                                                            Colors.green),
                                                        Text("Pesanan",
                                                            style: TextStyle(
                                                                fontSize:
                                                                10)),
                                                        Text("Masuk",
                                                            style: TextStyle(
                                                                fontSize: 10))
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(Icons.list,
                                                            color:
                                                            Colors.green),
                                                        Text("Pesanan",
                                                            style: TextStyle(
                                                                fontSize:
                                                                10)),
                                                        Text("Diproses",
                                                            style: TextStyle(
                                                                fontSize: 10))
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .directions_car,
                                                            color:
                                                            Colors.green),
                                                        Text("Pesanan",
                                                            style: TextStyle(
                                                                fontSize:
                                                                10)),
                                                        Text("Diterima",
                                                            style: TextStyle(
                                                                fontSize: 10))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8, left: 8),
                                        child: Container(
                                            height: 30,
                                            width: 65,
                                            child: Card(
                                              color: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      6.0)),
                                              child: Center(
                                                  child: Text(
                                                    "Selesai",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
Widget _filterPesanan(){
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
                      "Pesanan",
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
                      child: Text("Urutkan berdasarkan", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {

                        },
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Pesanan Masuk',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.normal)),
                                  ))),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {

                        },
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Pesanan Diproses',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.normal)),
                                  ))),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {

                        },
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Pesanan Ditolak',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.normal)),
                                  ))),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () {

                        },
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Pesanan Selesai',
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.normal)),
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
      )
  );
}