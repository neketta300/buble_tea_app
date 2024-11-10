import 'package:buble_tea_app/models/shop.dart';
import 'package:buble_tea_app/pages/home_page.dart';
import 'package:buble_tea_app/pages/login_page.dart';
import 'package:buble_tea_app/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BubbleTeaShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: const Color.fromRGBO(175, 165, 153, 1),
        ),
        home: const LoginOrRegister(),
      ),
    );
  }
}
