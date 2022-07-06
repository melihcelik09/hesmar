import 'package:flutter/material.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/widgets/accordion.dart';

import '../widgets/bottom_navbar.dart';

class KarZarar extends StatelessWidget {
  const KarZarar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List karZarar = [
      {
        'month': 'Ocak',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      },
      {
        'month': 'Şubat',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      },
      {
        'month': 'Mart',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      },
      {
        'month': 'Nisan',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      },
      {
        'month': 'Mayıs',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      },
      {
        'month': 'Haziran',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      },
      {
        'month': 'Temmuz',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      },
      {
        'month': 'Ağustos',
        'current': '120 TL kar',
        'pred': '70 TL daha kar edebilirdiniz.'
      }
    ];
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Kar Zarar', style: Constants.chipText),
        leading: const Icon(Icons.auto_graph, size: 40, color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white))
        ],
      ),
      body: Column(
        children: [
          Accordion(list: karZarar),
        ],
      ),
    );
  }
}
