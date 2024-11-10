import 'package:buble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    // classic bubble tea
    Drink(
      name: "Classic Bubble Tea",
      price: "4.00",
      imagePath: "assets/images/classic_bubble_tea.png",
    ),
    Drink(
      name: "Green Tea",
      price: "4.00",
      imagePath: "assets/images/green_tea.png",
    ),
    Drink(
      name: "Fruit Tea with Peach",
      price: "4.00",
      imagePath: "assets/images/peach_fruit_tea.png",
    ),
    Drink(
      name: "Bubble Tea with Bluebberry",
      price: "4.00",
      imagePath: "assets/images/blueberry_bubble_tea.png",
    ),
    Drink(
      name: "Chockolate Bubble Tea",
      price: "4.00",
      imagePath: "assets/images/chokolate_bubble_tea.png",
    ),
  ];

  // list of drinks in user cart
  final List<Drink> _userCart = [];
  // GETTERS
  List<Drink> get shop => _shop;

  List<Drink> get cart => _userCart;
  // SETTERS
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners(); // вызовет ребилд в том виджете где находится
  }

  // remove from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
