import 'dart:math';

import 'package:blackjack/src/entities/cardentity.dart';
import 'package:blackjack/src/entities/player.dart';
import 'package:blackjack/src/entities/roles.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CardsViewBloc {
  List<Player> _players = [
    Player("Hráč 1", Roles.Player),
    Player("Dealer", Roles.Dealer)
  ];

  BehaviorSubject<Map<String, List<CardEntity>>> _subject = BehaviorSubject.seeded(Map());
  Stream<Map<String, List<CardEntity>>> get subject => _subject.stream;

  Map<String, List<CardEntity>> _cardPool;
  var _randomizer;
  BuildContext _context;

  CardsViewBloc(BuildContext context) {
    _randomizer = new CardRandomizer();
    _cardPool = new Map<String, List<CardEntity>>();
    _context = context;
  }

  void start(Player player) {
    for (var i = 0; i < 2; i++) {
      this.draw(player);
    }
  }

  Future<void> _win(Player player) async{
      return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vyhrál jste'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(''),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Potvrdit'),
              onPressed: () {
                Navigator.pop(context);
                _restart();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _tie(Player player) async{
      return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vyhrál jste'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(''),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Potvrdit'),
              onPressed: () {
                Navigator.pop(context);
                _restart();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _lost(Player player) async{
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prohrál jste'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(''),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Potvrdit'),
              onPressed: () {
                Navigator.pop(context);
                _restart();
              },
            ),
          ],
        );
      },
    );
  }

  void draw(Player player) {
    var cardList;
    if (_cardPool[player.name] != null) {
      cardList = _cardPool[player.name];
    } else {
      cardList = new List<CardEntity>();
    }
    var card = _randomizer.randomize();
    cardList.add(card);
    _cardPool[player.name] = cardList;

    this.summarize(player, isHitting: true);
    _subject.sink.add(_cardPool);
  }

  void standByMe(Player player) {
    var totalCountDealer = getPoints(_players[1]);

    if (totalCountDealer < 17) {
      draw(_players[1]);
      standByMe(_players[1]);
    } else {
      this.summarize(player);
    }
  }

  int getPoints(Player player) {
    if (_cardPool[player.name] == null) {
      return 0;
    }

    var cards = _cardPool[player.name];
    int totalCount = 0;
    
    cards.forEach((e) => {
      if (e.value == "J" || e.value == "Q" || e.value == "K") {
        totalCount += 10
      } else if (e.value == "A") {
        totalCount += 11
      } else {
        totalCount += int.parse(e.value)
      }
    });

    return totalCount;
  }

  void summarize(Player player, {bool isHitting = false}) {
    var cards = _cardPool[player.name];
    var totalCountPlayer = getPoints(player);
    var totalCountDealer = getPoints(_players[1]); 

    if ((totalCountPlayer > 21 || totalCountDealer == 21 || totalCountPlayer < totalCountDealer && !isHitting)) && !(cards.length == 2 && cards.every((element) => element.value == "A"))) {
      this._lost(player);
    } else if (!isHitting && totalCountPlayer == totalCountDealer) {
      this._tie(player);
    } else if ((totalCountPlayer > totalCountDealer) || (cards.length == 2 && cards.every((element) => element.value == "A")) && !isHitting) {
      this._win(player);
    }
  }

  void _restart() {
    _randomizer.refill();
    _cardPool = new Map<String, List<CardEntity>>();
    start(_players[0]);
    start(_players[1]);
  }

  void dispose() {
    _subject?.close();
  }
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
  List<CardEntity> _cards = [];

  CardRandomizer() {
    this.refill();
  }

  CardEntity randomize() {
    var random = new Random();
    var index = random.nextInt(_cards.length);

    if (_cards.length == 0) throw new OutOfCardsException();

    var card = _cards[index];
    _cards.removeAt(index);

    return card;
  }

  void refill() {
    _cards = [];

    _colors.forEach((color) {
      _values.forEach((value) {
        _cards.add(new CardEntity(value, color));
      });
    });
  }
}

class OutOfCardsException implements Exception {}
