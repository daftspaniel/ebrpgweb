class Character {
  int hp = 0;
  int maxhp = 0;
  String name = "Nameless Thingy";
  List items = [];
  int px = 0;
  int py = 0;
  int armour = 0;
  int spirit = 0;
  int agility = 0;
  int gold = 0;
  int level = 0;
  int attack = 0;

  bool monster;

  Character(this.name, this.level, this.hp, this.armour, this.spirit,
      this.agility, this.attack) {
    maxhp = hp;
    monster = true;
  }

  get heartCount {
    return (10 * (hp / maxhp)).toInt();
  }
}
//

//def getAttack(self):
//a = RND(attack) + RND(spirit)
//if monster and hp<4:
//a = 1
//return a
//
//
//def defend(self, oppAttack, defend = True ):
//if defend:
//a = int( (oppAttack - ((armour + agility) / 5)) );
//else :
//a = oppAttack
//if a > 0: hp -= a;
