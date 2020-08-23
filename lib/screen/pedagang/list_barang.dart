import 'package:flutter/material.dart';

class ListBarang extends StatefulWidget {
  @override
  _ListBarangState createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  final TextEditingController _controller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
                      "Daftar Belanja",
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 3),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15, bottom: 10),
                                  child: Text("Tanggal Pesanan",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Column(
                                  children: <Widget>[
                                    RaisedButton(
                                      onPressed: () => _selectDate(context),
                                      // Refer step 3
                                      child: Text(
                                        'Select date',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Colors.pink,
                                    ),
                                    Text(
                                      "${selectedDate.toLocal()}".split(' ')[0],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                height: 100,
                                width: 380,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          Text("Ibu Eza",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text("Perempatan Nomer 10c")
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 90, right: 10),
                                      child: Text("10x"),
                                    )
                                  ],
                                ),
                              )),
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
    );
  }
}
