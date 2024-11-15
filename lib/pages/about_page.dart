import 'package:buble_tea_app/components/mu_buttons.dart';
import 'package:buble_tea_app/models/drink.dart';
import 'package:buble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  final Drink drink;
  const AboutPage({super.key, required this.drink});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // customize sweetness
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double pearlsValue = 0.5;

  void cutomizeSweetnes(newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  void cutomizeIceness(newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  void cutomizePearlness(newValue) {
    setState(() {
      pearlsValue = newValue;
    });
  }

  void addToCart() {
    // add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    Navigator.pop(context);

    // let user know it has been suuccessfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Succeccfully added to cart!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            // drink image
            Image.asset(
              widget.drink.imagePath,
              height: 300,
            ),
            const SizedBox(
              height: 100,
            ),
            // slider to customize drink
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // sweetnes slider
                      SizedBox(
                        width: 50,
                        child: Text(
                          "Sweet",
                          style: TextStyle(
                            color: Colors.brown[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        inactiveColor: const Color.fromARGB(255, 155, 140, 118),
                        thumbColor: Colors.brown, // ползунок
                        activeColor: Colors.brown, // линия сама
                        onChanged: (value) => cutomizeSweetnes(value),
                      )
                    ],
                  ),
                  // ice slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // sweetnes slider
                      SizedBox(
                        width: 50,
                        child: Text(
                          "Ice",
                          style: TextStyle(
                            color: Colors.brown[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        inactiveColor: const Color.fromARGB(255, 155, 140, 118),
                        thumbColor: Colors.brown, // ползунок
                        activeColor: Colors.brown, // линия сама
                        onChanged: (value) => cutomizeIceness(value),
                      )
                    ],
                  ),

                  // pearls slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // sweetnes slider
                      SizedBox(
                        width: 50,
                        child: Text(
                          "Pearls",
                          style: TextStyle(
                            color: Colors.brown[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Slider(
                        value: pearlsValue,
                        label: pearlsValue.toString(),
                        divisions: 4,
                        inactiveColor: const Color.fromARGB(
                            255, 155, 140, 118), // неакт ползунок
                        thumbColor: Colors.brown, // ползунок
                        activeColor: Colors.brown, // линия сама
                        onChanged: (value) => cutomizePearlness(value),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyPrimaryButton(onTap: () => addToCart(), text: "Add to Cart")
          ],
        ),
      ),
    );
  }
}
