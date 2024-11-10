import 'package:buble_tea_app/components/my_drawer_tile.dart';
import 'package:buble_tea_app/pages/about_app_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    // final _authService = AuthService();
    // _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(175, 165, 153, 1),
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_outlined,
              size: 80,
              color: Colors.grey[200],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(
              color: Colors.white,
            ),
          ),
          // home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "A B O U T",
            icon: Icons.info,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutAppPage(),
                ),
              );
            },
          ),

          const Spacer(),
          MyDrawerTile(
            text: "L O G   O U T",
            icon: Icons.logout,
            onTap: () => logout(),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
