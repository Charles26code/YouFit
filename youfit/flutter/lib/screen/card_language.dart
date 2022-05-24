import 'package:flutter/material.dart';

class CardLanguage extends StatelessWidget {
  final String message;
  final String background;
  final bool pressed;
  final VoidCallback updatePressed; // fonction qui ne retourne rien
  final String white = 'img/fitness.jpg';

  CardLanguage(
      {required this.message,
      required this.background,
      required this.pressed,
      required this.updatePressed});
// On recupere une reference de la fonction updatePressed
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              fit: BoxFit.fill,
              image: AssetImage(pressed ? background : white),
              child: InkWell(
                onTap: updatePressed,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Abel-Regular',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
