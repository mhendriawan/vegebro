// To parse this JSON data, do
//
//     final modelProduk = modelProdukFromJson(jsonString);

import 'dart:convert';

ModelProduk modelProdukFromJson(String str) => ModelProduk.fromJson(json.decode(str));

String modelProdukToJson(ModelProduk data) => json.encode(data.toJson());

class ModelProduk {
  ModelProduk({
    this.isSuccess,
    this.data,
  });

  bool isSuccess;
  List<Datum> data;

  factory ModelProduk.fromJson(Map<String, dynamic> json) => ModelProduk(
    isSuccess: json["isSuccess"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.did,
    this.namaBrg,
    this.satuan,
    this.kategori,
    this.harga,
    this.catatan,
    this.images,
  });

  String did;
  String namaBrg;
  String satuan;
  String kategori;
  String harga;
  String catatan;
  String images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    did: json["DID"],
    namaBrg: json["NamaBrg"],
    satuan: json["Satuan"],
    kategori: json["Kategori"],
    harga: json["Harga"],
    catatan: json["Catatan"],
    images: json["Images"],
  );

  Map<String, dynamic> toJson() => {
    "DID": did,
    "NamaBrg": namaBrg,
    "Satuan": satuan,
    "Kategori": kategori,
    "Harga": harga,
    "Catatan": catatan,
    "Images": images,
  };
}
