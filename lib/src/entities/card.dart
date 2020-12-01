import 'package:blackjack/src/entities/color_enum.dart';

class Card {
  int value; //Value for render
  CardColorEnum cardColor;
  int weight; //Game weight - for counting the final sum
}
