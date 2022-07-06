import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/models/user_model.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginNotifier());

class LoginNotifier extends ChangeNotifier {
  final List<UserModel> _users = [];
  List<UserModel> get users => _users;
  void add(UserModel user) {
    _users.add(user);
    notifyListeners();
  }

  bool get isLogined => _users.isNotEmpty;
  void logout() {
    _users.clear();
    notifyListeners();
  }
}
