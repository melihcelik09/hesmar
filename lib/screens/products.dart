import 'package:flutter/material.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/widgets/bottom_navbar.dart';
import 'package:hesmar/widgets/category.dart';
import 'package:hesmar/widgets/search.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Constants.appThemeColor,
                    )),
                const Expanded(child: SearchWidget())
              ],
            ),
            const SizedBox(height: 10),
            const CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
