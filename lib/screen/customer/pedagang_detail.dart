import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PedagangDetail extends StatefulWidget {
  @override
  _PedagangDetailState createState() => _PedagangDetailState();
}

class _PedagangDetailState extends State<PedagangDetail> {

  final TextEditingController _controller = TextEditingController();

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
          Padding(
            padding:
            const EdgeInsets.only(top: 85, right: 20, left: 20, bottom: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pesanan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
              ],
            ),
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
              padding: const EdgeInsets.all(13),
              child: Text("Bang Hendri", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            height: 550,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 3),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0)),
                      child: Container(
                          width: 380,
                          child: Row(
                            children: [
                              Container(
                                height: 95,
                                width: 100,
                                child: Image.network('https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/6/7/f104dc8e-a1ff-475c-9b2e-fbbb190e7bb1.jpg')
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Bayam Hijau",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("(ikat)",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("Bayam yang ada hijau daunnya",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                          SizedBox(height: 10),
                                          Text("Rp. 2.000",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Container(
                                            width: 120,
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(Icons.remove_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        ),
                                                        Text("1",style: TextStyle(fontSize: 20),),
                                                        IconButton(
                                                          icon: Icon(Icons.add_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Card(
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          6.0)),
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    child: Center(
                                        child: Text(
                                          "Pesan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                  )
                                ),
                              )
                            ],
                          )),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0)),
                      child: Container(
                          width: 380,
                          child: Row(
                            children: [
                              Container(
                                  height: 95,
                                  width: 100,
                                  child: Image.network(
                                      'https://ecs7.tokopedia.net/img/cache/700/product-1/2015/10/9/5393445/5393445_3fa1f284-64ed-40c5-96ec-20823b10da90.jpg')
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Wortel",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("(500 gram)",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("500 gram",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                          SizedBox(height: 10),
                                          Text("Rp. 5.000",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Container(
                                            width: 120,
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(Icons.remove_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        ),
                                                        Text("1",style: TextStyle(fontSize: 20),),
                                                        IconButton(
                                                          icon: Icon(Icons.add_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Card(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            6.0)),
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      child: Center(
                                          child: Text(
                                            "Pesan",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )),
                                    )
                                ),
                              )
                            ],
                          )),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0)),
                      child: Container(
                          width: 380,
                          child: Row(
                            children: [
                              Container(
                                  height: 95,
                                  width: 100,
                                  child: Image.network(
                                      'https://s.blanja.com/picspace/737/340705/500.500_3369995785364587a47eab5cbffcbd9d.jpg')
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Cabai Merah",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("(500 gram)",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("Seperempat kg",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                          SizedBox(height: 10),
                                          Text("Rp. 7.000",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Container(
                                            width: 120,
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(Icons.remove_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        ),
                                                        Text("1",style: TextStyle(fontSize: 20),),
                                                        IconButton(
                                                          icon: Icon(Icons.add_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Card(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            6.0)),
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      child: Center(
                                          child: Text(
                                            "Pesan",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )),
                                    )
                                ),
                              )
                            ],
                          )),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0)),
                      child: Container(
                          width: 380,
                          child: Row(
                            children: [
                              Container(
                                  height: 95,
                                  width: 100,
                                  child: Image.network(
                                      'https://cf.shopee.co.id/file/63d2c9108317916216c960128b6d4edd')
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Daging Sapi",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("(250 gram)",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("Seperempat kg",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                          SizedBox(height: 10),
                                          Text("Rp. 30.000",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Container(
                                            width: 120,
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(Icons.remove_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        ),
                                                        Text("1",style: TextStyle(fontSize: 20),),
                                                        IconButton(
                                                          icon: Icon(Icons.add_circle,color: Colors.pink,size: 20,),
                                                          onPressed: (){},
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Card(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            6.0)),
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      child: Center(
                                          child: Text(
                                            "Pesan",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )),
                                    )
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
