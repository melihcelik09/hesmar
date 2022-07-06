import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/services/hesmar_api.dart';

final bagNotify = ChangeNotifierProvider((ref) => BagNotifier());

class BagNotifier extends ChangeNotifier {
  final List _bagItems = [];
  final List _idList = [];
  final List profitlossList = [];

  List get bagItems => _bagItems;
  List get idList => _idList;
  List get profitLoss => profitlossList;

  void addItemWithDetails(
      String name, String img, String itemId, double price, String market) {
    bagItems.add({
      'name': name,
      'imageUrl': img,
      'itemId': itemId,
      'price': price,
      'market': market,
    });

    _idList.add(itemId);
    notifyListeners();
  }

  isBagEmpty() {
    if (bagItems.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  double calculateTotal() {
    // debugPrint(cheap.toString());
    double total = 0;
    for (var i = 0; i < bagItems.length; i++) {
      total += bagItems[i]['price'];
    }
    return total;
  }

  profitloss(double userprice) {
    double apiPrice = profitlossList[0];
    double profit = userprice - apiPrice;
    if (profit >= 0) {
      return profit.toStringAsFixed(2);
    }
  }

  Future addBag(
    WidgetRef ref,
    String id,
    List productId,
  ) async {
    try {
      final _dio = ref.read(httpClientProvider);
      Response response = await _dio.post('shoppingLists', data: {
        'userId': id,
        'productId': productId,
      });
      debugPrint("Sepete eklendi: ${response.data}");
      profitLoss.add(response.data);
    } on DioError catch (e) {
      debugPrint("Sepete eklenemedi: ${e.message}");
    }
    notifyListeners();
  }
}
