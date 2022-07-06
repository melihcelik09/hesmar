import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/services/bag_items.dart';

class Bag extends ConsumerStatefulWidget {
  final String? user;
  const Bag({Key? key, required this.user}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BagState();
}

class _BagState extends ConsumerState<Bag> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(bagNotify.notifier);
    List items = notifier.bagItems;
    double price = notifier.calculateTotal();
    return Expanded(
      child: items.isEmpty
          ? const Center(
              child: Text('Sepetinizde ürün bulunmamaktadır.'),
            )
          : Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.66,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhysicalModel(
                            color: Colors.white,
                            elevation: 2,
                            shadowColor: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    items[index]['imageUrl'],
                                    height: 100,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index]['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          items[index]['market'],
                                          style: Constants.mutedText,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "${items[index]['price'].toString()}₺",
                                          style: Constants.mutedText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('TOTAL', style: TextStyle(fontSize: 16)),
                          Text('${price.toStringAsFixed(2)}₺',
                              style: const TextStyle(
                                fontSize: 32,
                                color: Constants.appThemeColor,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      ElevatedButton(
                        child: const Text('Alışverişi Tamamla',
                            style: Constants.chipText),
                        onPressed: () {
                          ref.read(bagNotify.notifier);
                          if (notifier.bagItems.isNotEmpty) {
                            notifier
                                .addBag(ref, widget.user.toString(),
                                    notifier.idList)
                                .then((value) {
                              if (notifier.profitloss(price) == null) {
                                _showMaterialErrorDialog(items);
                              } else {
                                _showMaterialDialog(
                                    notifier.profitloss(price), items);
                              }
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _showMaterialErrorDialog(List items) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hata'),
            content: const Text("Bir şeyler yanlış gitti"),
            actions: [
              ElevatedButton(
                child: const Text(
                  'Kapat',
                  style: Constants.chipText,
                ),
                onPressed: () {
                  setState(() {
                    items.clear();
                    Navigator.of(context).pop();
                  });
                },
              )
            ],
          );
        });
  }

  void _showMaterialDialog(String message, List items) {
    showDialog(
        context: context,
        builder: (context) {
          debugPrint(message.toString());
          return AlertDialog(
            title: const Text('Kar/Zarar Hesaplama'),
            content: Text(
              message == '0.00'
                  ? 'Maksimum karı elde ettiniz.'
                  : ' $message₺ daha kar edebilirdiniz.',
            ),
            actions: [
              ElevatedButton(
                child: const Text(
                  'Kapat',
                  style: Constants.chipText,
                ),
                onPressed: () {
                  setState(() {
                    items.clear();
                    Navigator.of(context).pop();
                  });
                },
              )
            ],
          );
        });
  }
}
