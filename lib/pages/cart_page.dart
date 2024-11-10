import 'package:buble_tea_app/components/drink_tile.dart';
import 'package:buble_tea_app/components/mu_buttons.dart';
import 'package:buble_tea_app/components/my_drawer.dart';
import 'package:buble_tea_app/models/drink.dart';
import 'package:buble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              const Padding(
                padding: EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
                child: Text(
                  "Your Cart",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              // List of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    Drink drink = value.cart[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 25.0,
                        left: 25.0,
                        bottom: 5.0,
                      ),
                      child: DrinkTile(
                          drink: drink,
                          onTap: () => removeFromCart(drink),
                          trailing: const Icon(Icons.delete)),
                    );
                  },
                ),
              ),
              // pay button
              MyPrimaryButton(onTap: () {}, text: "Pay Now"),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
