import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:vgo/screen/customer/home_pembeli.dart';
import 'package:vgo/screen/login.dart';
import 'package:vgo/screen/pedagang/home_pedagang.dart';
import 'package:vgo/screen/pedagang/tambah_produk.dart';
import 'package:vgo/screen/splashscreen.dart';
import 'package:vgo/screen/test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HalamanSplash(),
    );
  }
}