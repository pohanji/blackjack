import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: Image.asset(
          "assets/cards/hearts/9.png",
          scale: 1.5,
        ),
      ),
      Container(
          padding: const EdgeInsets.only(left: 32),
          child: Image.asset(
            "assets/cards/clubs/A.png",
            scale: 1.5,
          )),
      Container(
          padding: const EdgeInsets.only(left: 64),
          child: Image.asset(
            "assets/cards/clubs/10.png",
            scale: 1.5,
          )),
    ]);
  }
}
