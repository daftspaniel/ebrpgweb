import 'character.dart';
import 'consts.dart';
import 'player.dart';

class Arena {

  int _monsterId = 0;
  Character _monster;
  Player _p1;
  int _lastPlayerAttack = 0;
  int _lastMonsterAttack = 0;

  get monster => _monster;

  Arena(this._p1, this._monsterId) {
    createMonster();
  }

  void createMonster() {
    if (_monsterId == NINJA)
      _monster = new Character("Ninja", 1, 9, 2, 8);
    else if (_monsterId == SPIDER)
      _monster = new Character("Spider", 1, 8, 3, 9);
    else if (_monsterId == HEDGE)
      _monster = new Character("Veg Monster", 1, 7, 4, 3);
    else if (_monsterId == SNAKE)
      _monster = new Character("Snake", 1, 6, 5, 8);
    else if (_monsterId == BLOB)
      _monster = new Character("Blob", 1, 5, 6, 6);
    else if (_monsterId == GHOST)
      _monster = new Character("Ghost", 1, 5, 7, 4);
    else if (_monsterId == PHANTOM)
      _monster = new Character("Phantom", 1, 5, 8, 4);
    else if (_monsterId == SNAIL)
      _monster = new Character("Snail", 1, 4, 1, 2);
    else if (_monsterId == EVILSAGE)
      _monster = new Character("Evil Sage", 1, 9, 7, 5);
    else
    if (_monsterId == DRAGON) _monster = new Character("Dragon", 1, 50, 12, 12);
  }

  void generateAttacks() {
    _lastPlayerAttack = _p1.getAttack();
    _lastMonsterAttack = _monster.getAttack();
    print(_p1.getAttack());
    print(_monster.getAttack());
  }
}