import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/constants/constants.dart';
import 'package:hesmar/services/favorite_items.dart';
import 'package:hesmar/services/hesmar_api.dart';
import 'package:hesmar/services/logined_user.dart';
import 'package:hesmar/widgets/bottom_navbar.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(loginProvider.notifier);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
      body: user.isLogined
          ? SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    iconColor: Constants.appThemeColor,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    leading: const Icon(Icons.person, size: 80),
                    title: Text(
                      '${user.users[0].firstName} ${user.users[0].lastName}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Divider(thickness: 1),
                  ListTile(
                    iconColor: Constants.appThemeColor,
                    leading: const Icon(
                      Icons.mail,
                      size: 40,
                    ),
                    title: Text(
                      '${user.users[0].email}',
                    ),
                  ),
                  const Divider(thickness: 1),
                  ListTile(
                    iconColor: Constants.appThemeColor,
                    leading: const Icon(
                      Icons.location_pin,
                      size: 40,
                    ),
                    title: user.users[0].address == null ||
                            user.users[0].address == ''
                        ? const Text('Belirtilmemiş')
                        : Text(
                            '${user.users[0].address}',
                          ),
                  ),
                  const Divider(thickness: 1, color: Colors.black),
                  const SizedBox(height: 50),
                  const Divider(thickness: 1, color: Colors.black),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/kar-zarar');
                    },
                    iconColor: Constants.appThemeColor,
                    leading: const Icon(
                      Icons.auto_graph,
                      size: 40,
                    ),
                    title: const Text('Kâr / Zarar'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(thickness: 1),
                  ListTile(
                    onTap: () {},
                    iconColor: Constants.appThemeColor,
                    leading: const Icon(
                      Icons.workspace_premium,
                      size: 40,
                    ),
                    title: const Text('Başarılarım'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(thickness: 1),
                  ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/favorites-page');
                        ref.read(favoriteProvider.notifier);
                        ref.watch(favoriteListProvider);
                      },
                      iconColor: Constants.appThemeColor,
                      leading: const Icon(
                        Icons.favorite,
                        size: 40,
                      ),
                      title: const Text('Favorilerim'),
                      trailing: const Icon(Icons.arrow_forward_ios)),
                  const Divider(thickness: 1),
                  ListTile(
                    onTap: () {
                      user.logout();
                      Navigator.pushNamed(context, '/login-page');
                    },
                    iconColor: Constants.appThemeColor,
                    leading: const Icon(
                      Icons.logout,
                      size: 40,
                    ),
                    title: const Text('Çıkış Yap'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(thickness: 1, color: Colors.black),
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
