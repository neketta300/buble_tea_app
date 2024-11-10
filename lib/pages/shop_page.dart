import 'package:buble_tea_app/components/drink_tile.dart';
import 'package:buble_tea_app/components/my_drawer.dart';
import 'package:buble_tea_app/models/drink.dart';
import 'package:buble_tea_app/models/shop.dart';
import 'package:buble_tea_app/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // about page
  void aboutPage(Drink drink) {
    // navigate to addons page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutPage(
          drink: drink,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: const Color.fromRGBO(175, 165, 153, 1),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  // heading
                  "Bubble Tea Shop",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),

                // list of drinks for sale
                Expanded(
                  child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      // get individual dring from shop
                      Drink individualDrink = value.shop[index];

                      // return that drink a tile
                      return DrinkTile(
                        drink: individualDrink,
                        onTap: () => aboutPage(individualDrink),
                        trailing: const Icon(Icons.arrow_forward),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
