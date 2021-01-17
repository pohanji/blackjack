import 'package:blackjack/src/entities/roles.dart';

///Player Entity, just to know the roles etc. It might be more useful on multiplayer session

class Player {
  Player(this.name, this.role);

  String name;

  Roles role;
}