import 'package:flutter/material.dart';
import 'package:hesmar/constants/constants.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = [
      {
        'name': 'Atıştırmalık',
        'image': 'assets/images/category/atistirmalik.png',
      },
      {
        'name': 'Sebze & Meyve',
        'image': 'assets/images/category/sebze&meyve.png',
      },
      {
        'name': 'Süt ve süt ürünleri',
        'image': 'assets/images/category/sutveurunleri.png',
      },
      {
        'name': 'Et ve et ürünleri',
        'image': 'assets/images/category/etveurunleri.png',
      },
      {
        'name': 'Temizlik Malzemeleri',
        'image': 'assets/images/category/temizlikmalzemeleri.png',
      },
      {
        'name': 'Kişisel Bakım',
        'image': 'assets/images/category/kisiselbakim.png',
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: category.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/${category[index]['name']}');
              },
              child: Column(
                children: [
                  Container(
                    width: 145,
                    height: 145,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Constants.dropShadowColor.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(7, 7),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('${category[index]['image']}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("${category[index]['name']}",
                      style: Constants.categoryText),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
