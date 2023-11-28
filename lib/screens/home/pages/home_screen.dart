import 'package:flutter/material.dart';
import '../../../Cart/cart_page.dart';
import '../../../config/Colors.dart';
import '../../../generated/l10n.dart';

import '../../Profile/ProfilePage.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    CartPage(),
    ProfilePage()
  ];

  final List<Color> _selectedItemColors = [
    Colors.black87,
    Colors.black87,
    Colors.black87,
    Colors.black87,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: _selectedItemColors[_currentIndex],
        unselectedItemColor: Colors.grey.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.Icon1Color,
            ),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: AppColors.Icon1Color,
            ),
            label: S.of(context).search,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.Icon1Color,
            ),
            label: S.of(context).cart_list,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: AppColors.Icon1Color,
            ),
            label: S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
