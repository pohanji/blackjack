import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/backgrounds/pozadi_hry.png"),
            fit: BoxFit.cover)),
            child: null)
    );
  }

}