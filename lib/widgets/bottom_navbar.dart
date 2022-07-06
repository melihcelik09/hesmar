import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hesmar/services/logined_user.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.read(loginProvider.notifier);
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/home-page');
                break;
              case 1:
                Navigator.pushNamed(context, '/all-products');
                break;
              case 2:
                Navigator.pushNamed(context, '/profile-page');
                break;
              case 3:
                Navigator.pushNamed(context, '/shopping-list');
                break;
              case 4:
                Navigator.pushNamed(context, '/location-page');
                break;
            }
          },
          currentIndex: widget.currentIndex,
          items: user.isLogined
              ? [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Anasayfa',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Arama',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Hesap',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Liste',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.location_pin),
                    label: 'Konum',
                  ),
                ]
              : [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Anasayfa',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Arama',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Hesap',
                  )
                ],
        );
      },
    );
  }
}
