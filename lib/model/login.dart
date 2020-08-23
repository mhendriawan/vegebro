// To parse this JSON data, do
//
//     final modelLogin = modelLoginFromJson(jsonString);

import 'dart:convert';

ModelLogin modelLoginFromJson(String str) => ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  ModelLogin({
    this.isSuccess,
    this.data,
    this.length,
  });

  bool isSuccess;
  List<Datum> data;
  int length;

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
    isSuccess: json["isSuccess"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    length: json["length"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "length": length,
  };
}

class Datum {
  Datum({
    this.id,
    this.nama,
    this.username,
    this.typeUser,
    this.email,
    this.nomorTlp,
  });

  String id;
  String nama;
  String username;
  String typeUser;
  String email;
  String nomorTlp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["Nama"],
    username: json["username"],
    typeUser: json["TypeUser"],
    email: json["Email"],
    nomorTlp: json["NomorTlp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Nama": nama,
    "username": username,
    "TypeUser": typeUser,
    "Email": email,
    "NomorTlp": nomorTlp,
  };
}
