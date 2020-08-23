import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgo/screen/pedagang/list_barang.dart';
import 'package:vgo/screen/pedagang/pelanggan.dart';
import 'package:vgo/screen/pedagang/pesanan.dart';
import 'package:vgo/screen/pedagang/produk.dart';
import 'package:vgo/screen/pedagang/profile.dart';

class HomePedagang extends StatefulWidget {
  @override
  _HomePedagangState createState() => _HomePedagangState();
}

class _HomePedagangState extends State<HomePedagang> {
  int selectedPage = 0;
  final _pageOptions = [
    Profile(),
    Produk(),
    Pelanggan(),
    Pesanan(),
    ListBarang()
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
          TabItem(
            icon: Icons.home,
            title: 'Beranda',
          ),
          TabItem(icon: Icons.local_mall, title: 'Produk'),
          TabItem(icon: Icons.grade, title: 'Pelanggan'),
          TabItem(icon: Icons.shopping_cart, title: 'Pesanan'),
          TabItem(icon: Icons.list, title: 'List Barang'),
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
