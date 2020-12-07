import 'package:blackjack/src/entities/color_enum.dart';

class Card {
  String value; //Value for render
  CardColorEnum cardColor;
  int weight; //Game weight - for counting the final sum

  Card(String value, CardColorEnum cardColor, int weight) {
    this.value = value;
    this.cardColor = cardColor;
    this.weight = weight;
  }
}
