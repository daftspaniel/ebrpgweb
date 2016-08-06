import 'character.dart';
import 'gridpoint/gridpoint.dart';

class Player extends Character {
  int diamonds;
  int exp;
  int food;

  GridPoint _position;

  GridPoint get position {
    return _position;
  }

  set position(GridPoint aPosition) {
    _position = aPosition;
  }

  List items = [];

  Player(this._position) : super(
      "Dartisan",
      1,
      25,
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
