import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/screens/new_detail_page.dart';

class BarcodeWidget extends ConsumerWidget {
  const BarcodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        scan().then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        path: '',
                        searchText: '',
                        barcode: value,
                      )));
        });

        // final barcode = ref.watch(barcodeProvider(scan()));
      },
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/hesmar-barcode.png',
              width: 140,
            ),
            const Text('BARKOD',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Constants.appThemeColor))
          ],
        ),
      ),
    );
  }
}

Future scan() async {
  var result = await BarcodeScanner.scan();

  debugPrint('tarama sonucu: ${result.rawContent}');

  return result.rawContent;
}
