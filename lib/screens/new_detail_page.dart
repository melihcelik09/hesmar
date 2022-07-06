import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/models/hesmar_model.dart';
import 'package:hesmar/services/bag_items.dart';
import 'package:hesmar/services/hesmar_api.dart';
import 'package:hesmar/services/logined_user.dart';
import 'package:hesmar/widgets/bottom_navbar.dart';
import 'package:hesmar/widgets/search.dart';

class DetailPage extends ConsumerStatefulWidget {
  final String path;
  final String searchText;
  final String barcode;
  const DetailPage({
    Key? key,
    required this.barcode,
    required this.path,
    required this.searchText,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.read(loginProvider.notifier);
    final bag = ref.read(bagNotify.notifier);
    AsyncValue productList;

    if (widget.path.isEmpty && widget.barcode.isEmpty) {
      productList = ref.watch(searchProvider(widget.searchText));
    } else if (widget.barcode.isNotEmpty) {
      productList = ref.watch(barcodeProvider(widget.barcode));
    } else {
      productList = ref.watch(hesmarProvider(widget.path));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Arama', style: Constants.chipText),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SearchWidget(),
            const SizedBox(height: 5),
            Expanded(
              child: SizedBox(
                child: productList.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('Aramanızla eşleşen ürün bulunamadı.'),
                      );
                    } else {
                      return GridView.builder(
                          shrinkWrap: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<Market> markets = data[index].markets;
                            List<Market> sortedMarkets = markets.toList()
                              ..sort(
                                  (a, b) => a.unitPrice.compareTo(b.unitPrice));
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/product-detail',
                                        arguments: {
                                          //  'userId': user.users[0].id,
                                          'id': data[index].id,
                                          'category': data[index].category,
                                          'brand': data[index].brand,
                                          'barcode': data[index].barcode,
                                          'markets': data[index].markets,
                                          'name': data[index].name,
                                          'imageUrl': data[index].imageUrl,
                                          'unitsInStock':
                                              data[index].unitsInStock,
                                          'isFavorite': data[index].favorite,
                                        });
                                  },
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.maxFinite,
                                    child: Card(
                                      elevation: 5,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Image.network(
                                                data[index].imageUrl,
                                                fit: BoxFit.fill),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '₺${sortedMarkets[0].unitPrice}',
                                                style:
                                                    Constants.productSearchText,
                                              ),
                                              Text(
                                                data[index].name,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Constants.appThemeColor,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      bag.addItemWithDetails(
                                        data[index].name,
                                        data[index].imageUrl,
                                        data[index].id,
                                        sortedMarkets[0].unitPrice,
                                        sortedMarkets[0].name,
                                      );

                                      debugPrint(
                                          '${data[index].name} added to bag');
                                    },
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  error: (error, stack) {
                    return Center(
                      child: Text('Hata oluştu $error'),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
