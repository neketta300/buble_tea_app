import 'package:buble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    Offset? _tapPosition;

    return GestureDetector(
      onTapDown: (details) {
        // Сохраняем позицию касания
        _tapPosition = details.globalPosition;
      },
      onTap: onTap,
      onLongPress: () async {
        // Получаем глобальные координаты и вычисляем позиции для меню
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final Offset position = overlay.globalToLocal(_tapPosition!);

        showMenu(
          menuPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          color: const Color.fromRGBO(175, 165, 153, 1),
          context: context,
          position: RelativeRect.fromLTRB(
            position.dx,
            position.dy,
            screenWidth - position.dx,
            screenHeight - position.dy,
          ),
          items: [
            const PopupMenuItem<String>(
              value: 'share',
              child: Center(
                child: Text(
                  'Share',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ).then((value) async {
          if (value == 'share') {
            await Share.share('Checkout our best Bubble Tea: ${drink.name}');
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            drink.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
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
