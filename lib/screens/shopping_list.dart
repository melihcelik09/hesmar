import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/services/logined_user.dart';
import 'package:hesmar/widgets/bag.dart';
import 'package:hesmar/widgets/bottom_navbar.dart';

class ShoppingList extends ConsumerStatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppingListState();
}

class _ShoppingListState extends ConsumerState<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    final user = ref.read(loginProvider.notifier);
    debugPrint("user id: ${user.users[0].id}");
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
      body: user.isLogined
          ? SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Alışveriş Listem', style: Constants.bagText),
                  ),
                  Bag(user: user.users[0].id),
                ],
              ),
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Giriş Yapılmamış', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text(
                    'Giriş Yapmak İçin Tıkla',
                    style: Constants.chipText,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login-page');
                  },
                )
              ],
            )),
    );
  }
}
