import 'package:blackjack/src/entities/player.dart';
import 'package:blackjack/src/entities/roles.dart';
import 'package:blackjack/src/pages/game/bloc/cards_view_bloc.dart';
import 'package:blackjack/src/pages/game/screen/card_view.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final List<Player> _players = [
    Player("Hráč 1", Roles.Player),
    Player("Dealer", Roles.Dealer)
  ];
  CardsViewBloc _viewBloc;


  @override
  Widget build(BuildContext context) {
    _viewBloc = CardsViewBloc(context);
    _viewBloc.start(_players[0]);
    _viewBloc.start(_players[1]);

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgrounds/pozadi_hry.png"),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                FlatButton(
                  child: Text(
                    "MENU",
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
                  onPressed: () => {Navigator.pop(context)},
                ),
                Align(
                  child: StreamBuilder(
                    stream: _viewBloc.subject,
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        throw new Exception("oof");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center(child: CircularProgressIndicator());
                      
                      return CardView(snapshot.data[_players[1].name], role: _players[1].role);
                    },
                  ),
                  alignment: Alignment.topCenter,
                ),
                Align(
                  child: StreamBuilder(
                    stream: _viewBloc.subject,
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center(child: CircularProgressIndicator());

                      if (snapshot.hasError) {
                        throw new Exception("oof");
                      }
                      return Row (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            onPressed: () => _viewBloc.standByMe(_players[0]),
                            child: Text("STAND",
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
                          ),
                          CardView(snapshot.data[_players[0].name]),
                          FlatButton(
                            onPressed: () => _viewBloc.hitMeBabyOneMoreTime(_players[0]), 
                            child: Text("HIT ME",
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
                          ),
                      ],);
                    },
                  ),
                  alignment: Alignment.bottomCenter,
                )
              ],
            )));
  }
}
