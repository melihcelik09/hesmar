import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/models/user_model.dart';
import 'package:hesmar/services/logined_user.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://hesmar.herokuapp.com/api/v1/users';

  Future<LoginNotifier?> login(
      {required WidgetRef ref,
      required String email,
      required String password}) async {
    final users = ref.read(loginProvider.notifier);
    UserModel? user;
    try {
      final response = await _dio.post('$_baseUrl/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        debugPrint('Login success');
        user = UserModel.fromJson(response.data);
        users.add(user);
      } else {
        throw Exception('Kullanıcı bulunamadı');
      }
      return users;
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint("Dio Error!");
        debugPrint("Status: ${e.response?.statusCode}");
      } else {
        debugPrint("Error sending request");
        debugPrint("Message: ${e.message}");
      }
      return null;
    }
  }

  Future register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String address,
  }) async {
    try {
      await _dio.post(_baseUrl, data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'address': address,
      });
      debugPrint("Kullanıcı kaydı başarılı!");
    } on DioError catch (e) {
      if (e.response != null) {
        debugPrint("Dio Error!");
        debugPrint("Status: ${e.response?.statusCode}");
      } else {
        debugPrint("Error sending request");
        debugPrint("Message: ${e.message}");
      }
    }
  }
}
