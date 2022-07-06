import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/models/bag_model.dart';
import 'package:hesmar/models/hesmar_model.dart';

final httpClientProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://hesmar.herokuapp.com/api/v1/',
    ),
  );
});
final hesmarProvider = FutureProvider.autoDispose
    .family<List<HesmarModel>, String>((ref, categoryName) async {
  try {
    final dio = ref.read(httpClientProvider);
    final response =
        await dio.get('products/getProductByCategoryName/$categoryName');
    List<HesmarModel> productsList = [];
    if (response.statusCode == 200) {
      productsList =
          (response.data as List).map((e) => HesmarModel.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load post');
    }
    return productsList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
});
final favoriteListProvider = FutureProvider.autoDispose((ref) async {
  try {
    final dio = ref.read(httpClientProvider);
    final response = await dio.get('products/getProductByFavorite');
    List<HesmarModel> productsList = [];
    debugPrint('Favoriler geldi');

    productsList =
        (response.data as List).map((e) => HesmarModel.fromMap(e)).toList();
    return productsList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
});
final searchProvider = FutureProvider.family(
  (ref, arg) async {
    debugPrint('products/getProductByName/$arg');
    try {
      final dio = ref.read(httpClientProvider);
      final response = await dio.get('products/getProductByName/$arg');
      List<HesmarModel> productsList = [];
      if (response.statusCode == 200) {
        productsList =
            (response.data as List).map((e) => HesmarModel.fromMap(e)).toList();
      } else {
        throw Exception('Aradığınız ürün bulunamadı');
      }
      return productsList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  },
);

final barcodeProvider = FutureProvider.family(
  (ref, barcode) async {
    debugPrint('products/getProductByBarcodeNumber/$barcode');
    try {
      final dio = ref.read(httpClientProvider);
      final response =
          await dio.get('products/getProductByBarcodeNumber/$barcode');
      List<HesmarModel> productsList = [];
      debugPrint('Barcode geldi');
      if (response.statusCode == 200) {
        productsList =
            (response.data as List).map((e) => HesmarModel.fromMap(e)).toList();
      } else {
        throw Exception('Aradığınız ürün sisteme kayıtlı değildir.');
      }
      return productsList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  },
);

// final bagProvider = FutureProvider.family.autoDispose((ref, userId) async {
//   try {
//     final dio = ref.read(httpClientProvider);

//     final response =
//         await dio.get('shoppingLists/getShoppingListByUserId/$userId');
//     List<BagModel> bagList = [];
//     if (response.statusCode == 200) {
//       debugPrint("Sepete ait kullanıcı: $userId");
//       debugPrint('bagProvider: ${response.data}');
//       debugPrint(bagList.toString());
//       debugPrint('Ürünler sepete geldi');
//       bagList =
//           (response.data as List).map((e) => BagModel.fromMap(e)).toList();
//     } else {
//       throw Exception('Sepetiniz boş');
//     }
//     return bagList;
//   } on DioError catch (e) {
//     return Future.error(e.message);
//   }
// });

final bagProvider = FutureProvider.autoDispose((ref) async {
  try {
    final dio = ref.read(httpClientProvider);

    final response = await dio.get('shoppingLists');
    List<BagModel> bagList = [];
    if (response.statusCode == 200) {
      debugPrint('bagProvider: ${response.data}');
      debugPrint('Ürünler sepete geldi');
      bagList =
          (response.data as List).map((e) => BagModel.fromMap(e)).toList();
    } else {
      throw Exception('Sepetiniz boş');
    }
    return bagList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
});
