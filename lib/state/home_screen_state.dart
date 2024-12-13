import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/screens/faverote_screen.dart';
import 'package:store_app_2/screens/home_screen.dart';
import 'package:store_app_2/screens/category_screen.dart';
import 'package:store_app_2/screens/setting_screen.dart';

class HomeScreenState extends StatefulWidget {
  @override
  State<HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    categoryScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          iconSize: 24,
          selectedFontSize: 10,
          selectedItemColor: KPriymryColor,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
    );
  }
}
