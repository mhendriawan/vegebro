import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:vgo/screen/customer/beranda_pembeli.dart';
import 'package:vgo/screen/customer/pedagang.dart';
import 'package:vgo/screen/customer/pesanan.dart';

class HomePembeli extends StatefulWidget {
  @override
  _HomePembeliState createState() => _HomePembeliState();
}

class _HomePembeliState extends State<HomePembeli> {
  int selectedPage = 0;
  final _pageOptions = [
    BerandaPembeli(),
    Pedagang(),
    PesananPembeli(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.pink,
        style: TabStyle.flip,
        height: 60,
        items: [
          TabItem(icon: Icons.home,title: 'Beranda'),
          TabItem(icon: Icons.grade, title: 'Pedagang'),
          TabItem(icon: Icons.shopping_basket, title: 'Status Barang'),
        ],
        initialActiveIndex: 0,
        //optional, default as 0
        onTap: (int i) {
          setState(() {
            selectedPage = i;
          });
        },
      ),
    );
  }
}
