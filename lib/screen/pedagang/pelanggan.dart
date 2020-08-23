import 'package:flutter/material.dart';

class Pelanggan extends StatefulWidget {
  @override
  _PelangganState createState() => _PelangganState();
}

class _PelangganState extends State<Pelanggan> {

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
                      "Pelanggan",
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
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              builder: (BuildContext context, ScrollController scrollController) {
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 3),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 380,
                            child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundImage: AssetImage(
                                            'images/ibu2.jpg'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22, left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Ibu Tejo",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text("Perempatan Nomer 10c")
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, right: 10),
                                      child: Text("10x"),
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            height: 100,
                            width: 380,
                            child: Card(
                                color: Colors.grey[50],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundImage: AssetImage(
                                            'images/ibu1.jpg'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22, left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("Ny. Hendriawan",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text("Perempatan Nomer 5a")
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90, right: 10),
                                      child: Text("100x"),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
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
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
