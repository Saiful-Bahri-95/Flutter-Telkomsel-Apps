import 'package:flutter/material.dart';
import 'package:telkomsel_app/screens/cart/shop.dart';
import 'package:telkomsel_app/screens/explore/explore.dart';
import 'package:telkomsel_app/screens/home/home.dart';
import 'package:telkomsel_app/screens/menu/menu.dart';
import 'package:telkomsel_app/screens/poin/poin.dart';
import 'package:telkomsel_app/themes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final _screens = [
    HomePage(),
    PoinPage(),
    ShopPage(),
    ExplorePage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget customNavBar() {
      return BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: bottomNavText,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              child: Image.asset(
                'assets/icons/icon-home.png',
                width: 24,
                color: _selectedIndex == 0 ? redColor : greyColor,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              child: Image.asset(
                'assets/icons/icon-trophy.png',
                width: 24,
                color: _selectedIndex == 1 ? redColor : greyColor,
              ),
            ),
            label: 'POIN',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              child: Image.asset(
                'assets/icons/icon-cart.png',
                width: 24,
                color: _selectedIndex == 2 ? redColor : greyColor,
              ),
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              child: Image.asset(
                'assets/icons/icon-explore.png',
                width: 24,
                color: _selectedIndex == 3 ? redColor : greyColor,
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              child: Image.asset(
                'assets/icons/icon-menu.png',
                width: 24,
                color: _selectedIndex == 4 ? redColor : greyColor,
              ),
            ),
            label: 'Menu',
          ),
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: customNavBar(),
      body: Stack(
        children: _screens
            .asMap()
            .map(
              (i, screen) => MapEntry(
                i,
                Offstage(child: screen, offstage: i != _selectedIndex),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
