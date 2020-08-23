import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgo/model/login.dart';
import 'package:vgo/screen/pedagang/profile_pedagang.dart';
import 'package:http/http.dart' as http;


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
                        "Muhammad Hendriawan",
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
                              CupertinoPageRoute(builder: (context) => ProfilPedagang()));
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
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Pelanggan",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    )
                                  ],
                                ),
                              )),
                          Card(
                              color: Colors.amber,
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
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Pesanan",
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
                                      image: AssetImage("images/bg1.png"), fit: BoxFit.cover),
                                ),
                                height: 120,
                                width: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "25",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "List Barang",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    )
                                  ],
                                ),
                              ))
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
