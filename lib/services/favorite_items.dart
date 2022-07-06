import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/services/hesmar_api.dart';

final favoriteProvider = ChangeNotifierProvider((ref) => FavoriteNotifier());

class FavoriteNotifier extends ChangeNotifier {
  final List<String> _favoriteItems = [];
  List<String> get favoriteItems => _favoriteItems;
  void add(String item) {
    _favoriteItems.add(item);
    notifyListeners();
  }

  void remove(String item) {
    _favoriteItems.remove(item);
    notifyListeners();
  }

  bool contains(String id) {
    return _favoriteItems.contains(id);
  }

  Future changeFavorite(
    WidgetRef ref,
    String id,
  ) async {
    try {
      final _dio = ref.read(httpClientProvider);
      Response response = await _dio.get('products/changeFavorite/$id');
      if (response.statusCode == 200) {
        if (contains(id)) {
          remove(id);
        } else {
          add(id);
        }
      } else {
        throw Exception('Favori Listesi Boş');
      }
      debugPrint("Favoriye eklendi: ${response.data}");
    } on DioError catch (e) {
      debugPrint("Favoriye eklenemedi: ${e.message}");
    }
    notifyListeners();
  }
}
