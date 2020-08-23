// To parse this JSON data, do
//
//     final modelRegister = modelRegisterFromJson(jsonString);

import 'dart:convert';

ModelRegister modelRegisterFromJson(String str) => ModelRegister.fromJson(json.decode(str));

String modelRegisterToJson(ModelRegister data) => json.encode(data.toJson());

class ModelRegister {
  ModelRegister({
    this.data,
    this.status,
    this.error,
  });

  Data data;
  int status;
  bool error;

  factory ModelRegister.fromJson(Map<String, dynamic> json) => ModelRegister(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "error": error,
  };
}

class Data {
  Data({
    this.nama,
    this.typeUser,
    this.email,
    this.nomorTlp,
  });

  String nama;
  String typeUser;
  String email;
  String nomorTlp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    nama: json["Nama"],
    typeUser: json["TypeUser"],
    email: json["Email"],
    nomorTlp: json["NomorTlp"],
  );

  Map<String, dynamic> toJson() => {
    "Nama": nama,
    "TypeUser": typeUser,
    "Email": email,
    "NomorTlp": nomorTlp,
  };
}
