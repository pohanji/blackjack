import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children2 = [
                    Align(
                      child: Text("Pravidla",
                      style: TextStyle(
                      fontSize: 55,
                      color: Colors.white,
                      fontFamily: "Poker")),
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 15, top: 60, bottom: 10),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: 
                          Text("Karty a jejich hodnoty:",
                            style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Calibri",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),) 
                        ),
    
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
    
                        Text("Průběh hry:",
                          style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Calibri",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
    
                        Text("Na začátku hry každý hráč dostane 2 karty.\nPoté se krupiér vždy ptá hráče zda chce další kartu, nebo stačí.\nPokud hráč přesáhne 21, automaticky prohrál.\nPoté co všichni hráči dokončí svou hru ať už přesáhnutím 21 bodů součtu všech karet, nebo rozhodnutím že stačí.\nPoté hraje krupiér, který musí na 17 zůstat stát.",
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Calibri",
                          color: Colors.white,
                        ),),
                      ],
                    ),)
                  ];
        return Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/backgrounds/pozadi.png"),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: children2,
            
            )));
  }

}
