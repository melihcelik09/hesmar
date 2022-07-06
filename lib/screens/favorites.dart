import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/services/favorite_items.dart';
import 'package:hesmar/services/hesmar_api.dart';

import '../constants/constants.dart';
import '../widgets/bottom_navbar.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _favoriteItems = ref.watch(favoriteListProvider);
    final favorite = ref.read(favoriteProvider.notifier);
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(currentIndex: 2),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Favorilerim', style: Constants.chipText),
          leading: const Icon(Icons.favorite, size: 40, color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white))
          ],
        ),
        body: _favoriteItems.when(data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('Favorileriniz bulunmamaktadır.'),
            );
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Stack(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Expanded(
                                child: Image.network(
                                  data[index].imageUrl,
                                  height: 100,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    data[index].name,
                                    style: Constants.detailText,
                                    textAlign: TextAlign.center,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Constants.appThemeColor,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            onPressed: () {
                              favorite.changeFavorite(ref, data[index].id);
                              favorite.remove(data[index].id);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
        }, error: (error, stack) {
          return Center(child: Text('Hata oluştu: $error $stack'));
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }));
  }
}
