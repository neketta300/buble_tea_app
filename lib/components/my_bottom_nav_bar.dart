import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, top: 25),
      child: GNav(
        tabBorderRadius: 16,
        onTabChange: (value) => widget.onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Colors.grey[300], // no active color
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 8, // gap beetwen txt
        tabs: const [
          // shops
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),

          /// cart tab
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          )
        ],
      ),
    );
  }
}
