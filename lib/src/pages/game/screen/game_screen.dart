import 'package:blackjack/src/pages/game/screen/card_view.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgrounds/pozadi_hry.png"),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Align(
                  child: CardView(),
                  alignment: Alignment.topCenter,
                ),
                Align(
                  child: CardView(),
                  alignment: Alignment.bottomCenter,
                )
              ],
            )));
    // Stack(
    //   children: [
    //     FlatButton(
    //       child: Text(
    //         "MENU",
    //         style: TextStyle(
    //             fontFamily: "Calibri",
    //             fontWeight: FontWeight.bold,
    //             fontSize: 24),
    //       ),
    //       onPressed: () => {Navigator.pop(context)},
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [],
    //     )
    //   ],
    // )));
  }
}
