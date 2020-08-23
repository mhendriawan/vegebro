import 'package:flutter/material.dart';
import 'package:vgo/screen/customer/pedagang_detail.dart';

class Pedagang extends StatefulWidget {
  @override
  _PedagangState createState() => _PedagangState();
}

class _PedagangState extends State<Pedagang> {
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
                      "Pedagang",
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
                        hintText: 'Cari Pedagang',
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 3),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              var route = MaterialPageRoute(
                                  builder: (context) => PedagangDetail());
                              Navigator.push(context, route);
                            },
                            child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                                child: Container(
                                    width: 380,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 25.0,
                                          backgroundImage: AssetImage(
                                              'images/abang2.jpg'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 22, left: 8, bottom: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Muhammad Hendriawan",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text("Lontar V")
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
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