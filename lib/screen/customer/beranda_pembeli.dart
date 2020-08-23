import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vgo/screen/customer/profile_pembeli.dart';
import 'package:vgo/screen/pedagang/profile_pedagang.dart';

class BerandaPembeli extends StatefulWidget {
  @override
  _BerandaPembeliState createState() => _BerandaPembeliState();
}

class _BerandaPembeliState extends State<BerandaPembeli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Image.asset("images/menu.png"),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, right: 20, left: 20, bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VEGEBRO',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, fontFamily: 'Roboto'),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Selamat Datang,",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reza Nurfitriani",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: (){
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => ProfilePembeli()));
                        },
                      )
                    ],
                  )
                ],
              )),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.5,
              maxChildSize: 0.7,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  height: 600,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/bg1.png"), fit: BoxFit.cover),
                                ),
                                height: 120,
                                width: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "10",
                                      style: GoogleFonts.blackHanSans(
                                        fontSize: 45,
                                        color: Colors.white
                                    )),
                                    Text(
                                      "Pedagang",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          Card(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/bg2.png"), fit: BoxFit.cover),
                                ),
                                height: 120,
                                width: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "13",
                                        style: GoogleFonts.blackHanSans(
                                            fontSize: 45,
                                            color: Colors.white
                                        )),
                                    Text(
                                      "Pesanan",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
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
          )
        ],
      ),
    );
  }
}
