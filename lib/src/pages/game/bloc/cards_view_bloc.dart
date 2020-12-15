import 'dart:math';

import 'package:blackjack/src/entities/card.dart';

class CardsViewBloc {
  Map<String, List<Card>> _cardPool;
  var _randomizer;

  CardsViewBloc() {
    _randomizer = new CardRandomizer();
    _cardPool = new Map<String, List<Card>>();
  }

  void start(String playerName) {
    for (var i = 0; i < 2; i++) {
      this._draw(playerName);
    }
  }

  void _draw(String playerName) {
    var cardList;
    if (_cardPool[playerName] != null) {
      cardList = _cardPool[playerName];
    } else {
      cardList = new List<Card>();
    }
    cardList.add(_randomizer.randomize());
    _cardPool[playerName] = cardList;
  }

  void hitMeBabyOneMoreTime(String playerName) {}

  void standByMe(String playerName) {}
}

class CardRandomizer {
  List<String> _colors = ["clubs", "hearts", "spades", "diamonds"];
  List<String> _values = [
    "A",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "J",
    "Q",
    "K",
  ];
  List<Card> _cards = [];

  CardRandomizer() {
    this._refill();
  }

  Card randomize() {
    var random = new Random();
    var index = random.nextInt(_cards.length);

    if (_cards.length == 0) throw new OutOfCardsException();

    var card = _cards[index];
    _cards.removeAt(index);

    return card;
  }

  void _refill() {
    _cards = [];

    _colors.forEach((color) {
      _values.forEach((value) {
        _cards.add(new Card(value, color));
      });
    });
  }
}

class OutOfCardsException implements Exception {}
