import 'package:buble_tea_app/firebase_options.dart';
import 'package:buble_tea_app/models/shop.dart';
import 'package:buble_tea_app/services/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionColor: Colors.grey[500],
            selectionHandleColor: Colors.grey[300],
          ),
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: const Color.fromRGBO(175, 165, 153, 1),
        ),
        home: const AuthGate(),
      ),
    );
  }
}
