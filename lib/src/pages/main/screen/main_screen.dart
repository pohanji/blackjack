import 'dart:io';

import 'package:blackjack/src/pages/rules/rules_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgrounds/pozadi.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Text("BLACKJACK",
                      style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontFamily: "Poker")),
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  child: Text("ZAČÍT HRÁT",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Constantia",
                      )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                  color: Colors.white60,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => null),
                    )
                  },
                ),
                FlatButton(
                  child: Text("PRAVIDLA",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Constantia",
                      )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                  color: Colors.white60,
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RulesScreen()),
                    )
                  },
                ),
                FlatButton(
                  child: Text("UKONČIT",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Constantia",
                      )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  color: Colors.white60,
                  onPressed: () => exit(0),
                ),
              ],
            )));
  }
}

class MainScreenState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
