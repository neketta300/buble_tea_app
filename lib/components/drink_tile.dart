import 'package:buble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final void Function()? onTap;
  final Widget trailing;
  final Drink drink;
  const DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.brown[100], borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(
            drink.name,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[800]),
          ),
          subtitle: Text(
            "\$${drink.price}",
            style: const TextStyle(
              color: Color.fromARGB(255, 153, 148, 144),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Image.asset(drink.imagePath),
          trailing: trailing,
        ),
      ),
    );
  }
}
