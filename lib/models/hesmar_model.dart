// To parse this JSON data, do
//
//     final hesmarModel = hesmarModelFromMap(jsonString);

import 'dart:convert';

HesmarModel hesmarModelFromMap(String str) =>
    HesmarModel.fromMap(json.decode(str));

String hesmarModelToMap(HesmarModel data) => json.encode(data.toMap());

class HesmarModel {
  HesmarModel({
    required this.id,
    required this.category,
    required this.brand,
    required this.barcode,
    required this.markets,
    required this.name,
    required this.imageUrl,
    required this.unitsInStock,
    required this.favorite,
  });

  final String id;
  final Brand category;
  final Brand brand;
  final Barcode barcode;
  final List<Market> markets;
  final String name;
  final String imageUrl;
  final int unitsInStock;
  final bool favorite;

  factory HesmarModel.fromMap(Map<String, dynamic> json) => HesmarModel(
        id: json["id"],
        category: Brand.fromMap(json["category"]),
        brand: Brand.fromMap(json["brand"]),
        barcode: Barcode.fromMap(json["barcode"]),
        markets:
            List<Market>.from(json["markets"].map((x) => Market.fromMap(x))),
        name: json["name"],
        imageUrl: json["imageUrl"],
        unitsInStock: json["unitsInStock"],
        favorite: json["favorite"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category.toMap(),
        "brand": brand.toMap(),
        "barcode": barcode.toMap(),
        "markets": List<dynamic>.from(markets.map((x) => x.toMap())),
        "name": name,
        "imageUrl": imageUrl,
        "unitsInStock": unitsInStock,
        "favorite": favorite,
      };
}

class Barcode {
  Barcode({
    required this.number,
  });

  final int number;

  factory Barcode.fromMap(Map<String, dynamic> json) => Barcode(
        number: json["number"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
      };
}

class Brand {
  Brand({
    required this.name,
  });

  final String name;

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}

class Market {
  Market({
    required this.name,
    required this.unitPrice,
  });

  final String name;
  final double unitPrice;

  factory Market.fromMap(Map<String, dynamic> json) => Market(
        name: json["name"],
        unitPrice: json["unitPrice"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "unitPrice": unitPrice,
      };
}
