import 'package:flutter/material.dart';

class MyLogRegTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyLogRegTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 170, 158, 147),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[300]),
        ),
      ),
    );
  }
}
