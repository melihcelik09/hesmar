import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/models/hesmar_model.dart';
import 'package:hesmar/services/bag_items.dart';
import 'package:hesmar/services/favorite_items.dart';
import 'package:hesmar/widgets/bottom_navbar.dart';

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final favorite = ref.read(favoriteProvider.notifier);
    final bag = ref.read(bagNotify.notifier);
    ref.watch(favoriteProvider);
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    List<Market> markets = arguments['markets'];
    List<Market> sortedMarkets = markets.toList()
      ..sort((a, b) => a.unitPrice.compareTo(b.unitPrice));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Ürün Detayı', style: Constants.chipText),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              arguments['isFavorite'] ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              if (arguments['isFavorite']) {
                favorite.remove(arguments['id']);
                favorite.changeFavorite(ref, arguments['id']);
              } else {
                favorite.add(arguments['id']);
                favorite.changeFavorite(ref, arguments['id']);
              }
              setState(() {});
            },
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Image.network(
                arguments['imageUrl'],
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    '₺${sortedMarkets[0].unitPrice}',
                    style: Constants.productDetailText,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${arguments['name']}',
                    style: Constants.productDetailPriceText,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Constants.detailBackground,
                    height: 40,
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Mevcut Marketler',
                            style: Constants.mutedDetailText,
                          ),
                        )),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: markets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            bag.addItemWithDetails(
                                arguments['name'],
                                arguments['imageUrl'],
                                arguments['id'],
                                markets[index].unitPrice,
                                markets[index].name);
                            debugPrint(bag.bagItems.toString());
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(11),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '₺${markets[index].unitPrice}',
                                    style: Constants.productDetailText,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    markets[index].name,
                                    style: Constants.productDetailPriceText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
              child: const Text('Sepete Ekle', style: Constants.chipText),
              onPressed: () {
                bag.addItemWithDetails(
                  arguments['name'],
                  arguments['imageUrl'],
                  arguments['id'],
                  sortedMarkets[0].unitPrice,
                  sortedMarkets[0].name,
                );
                debugPrint('${arguments['name']} added to bag');
              },
            ),
          ),
        )
      ]),
    );
  }
}
