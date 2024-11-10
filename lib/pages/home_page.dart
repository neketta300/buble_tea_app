import 'package:buble_tea_app/components/my_bottom_nav_bar.dart';
import 'package:buble_tea_app/pages/cart_page.dart';
import 'package:buble_tea_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBoottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(175, 165, 153, 1),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBoottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
