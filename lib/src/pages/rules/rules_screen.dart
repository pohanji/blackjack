import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgrounds/pozadi.png"),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Align(
                  child: Text("Pravidla",
                  style: TextStyle(
                  fontSize: 55,
                  color: Colors.white,
                  fontFamily: "Poker")),
                  alignment: Alignment.topCenter,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Karty a jejich hodnoty:",
                      style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Calibri",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                    Text("Karty s hodnotou 2 - 10 mají hodnotu uvedenou na kartě.\nKarty J, Q a K mají hodnotu 10.\nKarta A může mít hodnotu 1 i 11. ",
                      style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Calibri",
                      color: Colors.white,
                    ),),

                    Text("Cíl hry:",
                      style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Calibri",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                    Text("Mít více než krupér.\nPokud hráč i krupiér překročí 21, vyhrává krupiér.\nV případě shodného počtu, krupiéra a hráče nevyhrává nikdo.",
                      style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Calibri",
                      color: Colors.white,
                    ),),
                  ],
                )
                
              ],
            
            )));
  }

}
