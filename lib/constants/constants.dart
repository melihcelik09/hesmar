import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';

class Constants {
  Constants._();
  static MaterialColor primarySwatch =
      const Color(0xFF50CB7A).toMaterialColor();
  static const detailBackground = Color(0xFFe9eef1);
  static const splashBackground = Color(0xFFf9f9f9);

  static const Color appThemeColor = Color.fromRGBO(80, 203, 122, 1);
  static const Color dropShadowColor = Color.fromRGBO(79, 203, 122, 1);
  static const TextStyle chipText = TextStyle(color: Colors.white);
  static const TextStyle productDetailText = TextStyle(
      color: Constants.appThemeColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static const TextStyle productSearchText = TextStyle(
      color: Constants.appThemeColor,
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static const TextStyle productDetailPriceText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const TextStyle listItemText =
      TextStyle(color: Constants.appThemeColor, fontWeight: FontWeight.bold);
  static const TextStyle listItemCheckedText = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough);
  static const TextStyle listTitleText =
      TextStyle(color: Constants.appThemeColor, fontSize: 18);
  static const TextStyle categoryText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Constants.appThemeColor);
  static const TextStyle bagText = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Constants.appThemeColor);
  static const TextStyle detailText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Constants.appThemeColor);
  static OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white, width: 2.0));
  static OutlineInputBorder disabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  );
  static ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      primary: Colors.white,
      fixedSize: const Size(200, 40));
  static TextStyle welcomeTitle = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Constants.appThemeColor);
  static TextStyle mutedText =
      const TextStyle(fontSize: 18, color: Colors.black54);
  static TextStyle mutedDetailText = const TextStyle(
      fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500);
}
//#50CB7A
//#4FCB7A
