import 'package:blackjack/src/entities/cardentity.dart';
import 'package:blackjack/src/entities/roles.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  List<CardEntity> _cards;
  Roles _role;
  
  CardView(List<CardEntity> cards, { Roles role = Roles.Player}) {
    _cards = cards;
    _role = role;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List<Widget>();

    for (var i = 0; i < _cards.length; i++) {
      if (_role == Roles.Dealer && i == 1) { 
        var widget = Container(
              padding: EdgeInsets.only(left: i.toDouble()*32),
              child: Image.asset(
                "assets/cards/back.png",
                scale: 1.5,
              ));
          widgets.add(widget);
          continue;
      }
      var widget = Container(
            padding: EdgeInsets.only(left: i.toDouble()*32),
            child: Image.asset(
              "assets/cards/${_cards[i].color}/${_cards[i].value}.png",
              scale: 1.5,
            ));
        widgets.add(widget);
      }

    return Stack(children: widgets);
  }
}
