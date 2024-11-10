import 'package:buble_tea_app/components/mu_buttons.dart';
import 'package:buble_tea_app/components/my_textfields.dart';
import 'package:buble_tea_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login
  void login() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(175, 165, 153, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              "assets/images/chokolate_bubble_tea.png",
              height: 300,
            ),

            const SizedBox(
              height: 70,
            ),

            // msg, app slogan
            const Text(
              "Boba is life",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // email textfield
            MyLogRegTextfield(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            // password textfield
            MyLogRegTextfield(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            // sign in buutton
            MyPrimaryButton(
              text: "Sign in",
              onTap: login,
            ),

            const SizedBox(
              height: 10,
            ),
            // not a member? reg now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 219, 212, 207),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Register now",
                    style: TextStyle(
                      color: Color.fromARGB(255, 219, 212, 207),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
