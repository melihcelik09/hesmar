import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/screens/favorites.dart';
import 'package:hesmar/screens/home.dart';
import 'package:hesmar/screens/kar_zarar.dart';
import 'package:hesmar/screens/location.dart';
import 'package:hesmar/screens/login.dart';
import 'package:hesmar/screens/new_detail_page.dart';
import 'package:hesmar/screens/password_remember.dart';
import 'package:hesmar/screens/product_detail_page.dart';
import 'package:hesmar/screens/products.dart';
import 'package:hesmar/screens/profile.dart';
import 'package:hesmar/screens/register.dart';
import 'package:hesmar/screens/shopping_list.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home-page': (context) => const HomePage(),
        '/Atıştırmalık': (context) => const DetailPage(
              path: 'Atıştırmalık',
              searchText: '',
              barcode: '',
            ),
        '/Sebze & Meyve': (context) => const DetailPage(
              path: 'Sebze & Meyve',
              searchText: '',
              barcode: '',
            ),
        '/Süt ve süt ürünleri': (context) => const DetailPage(
              path: 'Süt ve süt ürünleri',
              searchText: '',
              barcode: '',
            ),
        '/Et ve et ürünleri': (context) => const DetailPage(
              path: 'Et ve et ürünleri',
              searchText: '',
              barcode: '',
            ),
        '/Temizlik Malzemeleri': (context) => const DetailPage(
              path: 'Temizlik Malzemeleri',
              searchText: '',
              barcode: '',
            ),
        '/Kişisel Bakım': (context) => const DetailPage(
              path: 'Kişisel Bakım',
              searchText: '',
              barcode: '',
            ),
        '/product-detail': (context) => const ProductDetail(),
        '/register-page': (context) => const Register(),
        '/login-page': (context) => const Login(),
        '/password-remember': (context) => const PasswordRemember(),
        '/profile-page': (context) => const ProfilePage(),
        '/kar-zarar': (context) => const KarZarar(),
        '/favorites-page': (context) => const FavoritesPage(),
        '/location-page': (context) => const LocationPage(),
        '/shopping-list': (context) => const ShoppingList(),
        '/all-products': (context) => const Products(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Hesmar',
      theme: ThemeData(
        primarySwatch: Constants.primarySwatch,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 500,
        duration: 5000,
        splash: Image.asset('assets/images/splash_old.gif'),
        nextScreen: const Login(),
      ),
    );
  }
}
