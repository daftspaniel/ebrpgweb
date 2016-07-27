class Character {
  String name = "Nameless Thingy";

  int hp = 0;
  int maxhp = 0;

  int armour = 0;


  int gold = 0;
  int level = 0;
  int attack = 0;

  bool monster = true;

  Character(this.name, this.level, this.hp, this.armour,
      this.attack) {
    maxhp = hp;
  }

  get heartCount {
    return (10 * (hp / maxhp)).toInt();
  }
}
