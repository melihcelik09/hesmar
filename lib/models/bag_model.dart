// To parse this JSON data, do
//
//     final bagModel = bagModelFromMap(jsonString);

import 'dart:convert';

BagModel bagModelFromMap(String str) => BagModel.fromMap(json.decode(str));

String bagModelToMap(BagModel data) => json.encode(data.toMap());

class BagModel {
  BagModel({
    required this.id,
    required this.user,
    required this.products,
  });

  final String id;
  final User user;
  final List<Product> products;

  factory BagModel.fromMap(Map<String, dynamic> json) => BagModel(
        id: json["id"],
        user: User.fromMap(json["user"]),
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user.toMap(),
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  Product({
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

  factory Product.fromMap(Map<String, dynamic> json) => Product(
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

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.address,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String address;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "address": address,
      };
}
