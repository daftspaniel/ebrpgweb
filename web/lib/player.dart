import 'character.dart';

class Player extends Character {
  int diamonds;
  int exp;
  int food;
  int x, y;

  Player() : super(
      "Dartisan",
      1,
      25,
      1,
      1,
      1,
      4) {
    hp = 25;
    level = 1;
    monster = false;
    diamonds = 0;
    exp = 3;
    food = 0;
  }
}
