// To parse this JSON data, do
//
//     final vacations = vacationsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Vacations vacationsFromJson(String str) => Vacations.fromJson(json.decode(str));

String vacationsToJson(Vacations data) => json.encode(data.toJson());

class Vacations {
  Vacations({
    required this.data,
  });

  List<Vacation> data;

  factory Vacations.fromJson(Map<String, dynamic> json) => Vacations(
        data:
            List<Vacation>.from(json["data"].map((x) => Vacation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Vacation {
  Vacation({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.kota,
    required this.harga,
    required this.imageUrl,
  });

  int id;
  String nama;
  String deskripsi;
  String kota;
  String harga;
  String imageUrl;

  factory Vacation.fromJson(Map<String, dynamic> json) => Vacation(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        kota: json["kota"],
        harga: json["harga"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "kota": kota,
        "harga": harga,
        "image_url": imageUrl,
      };
}
