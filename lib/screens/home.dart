import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/services/logined_user.dart';
import 'package:hesmar/widgets/barcode.dart';
import 'package:hesmar/widgets/bottom_navbar.dart';
import 'package:hesmar/widgets/search.dart';
import 'package:hesmar/widgets/slider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(loginProvider.notifier);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // Text('Merhaba ${'user.firstName'}',
          //     style: Constants.welcomeTitle),
          title: user.isLogined
              ? Text('Merhaba ${user.users[0].firstName}',
                  style: Constants.welcomeTitle)
              : Text('Merhaba Misafir', style: Constants.welcomeTitle),
          actions: [
            IconButton(
              iconSize: 82,
              icon: Image.asset('assets/images/hesmar-logo.png'),
              onPressed: () {
                // Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(currentIndex: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SliderWidget(),
              const SearchWidget(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/all-products');
                    },
                    child: Container(
                      height: 220,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/hesmar-products.png',
                            width: 140,
                          ),
                          const Text('ÜRÜNLER',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.appThemeColor))
                        ],
                      ),
                    ),
                  ),
                  const BarcodeWidget()
                ],
              ),
            ],
          ),
        ));
  }
}
