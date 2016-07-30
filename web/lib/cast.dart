import 'consts.dart';
import 'grid.dart';
import 'gridpoint.dart';
import 'player.dart';
import 'statuslist.dart';
import 'util.dart';

class Cast {
  Grid room;
  Player p1;
  StatusList status;

  get currentPlayerLocation {
    return room.get(p1.position);
  }

  Cast(this.p1, this.room, this.status) {}

  void update() {
    List<int> neighbouring = room.getNeighbours(p1.position);
    int current = room.get(p1.position);

    if (neighbouring.contains(SHRUB)) {
      status.add("The trees are very thick and tall.");
    }
    if (neighbouring.contains(DUCK)) {
      status.add("Ducks says 'Quack'.");
    }
    if (neighbouring.contains(LLAMA)) {
      status.add("Llama says 'Orgle. Orgle'.");
    }
    if (neighbouring.contains(FARMER)) {
      status.add("The Farmer says Help yourself to leftover apples!");
    }

    if (neighbouring.contains(SHOPKEEPER)) {
      status.add("INCREASE YOUR ATTACK BY 5 FOR ONLY 100 GOLD");
    }

    if (neighbouring.contains(SAGE)) {
      status.add(getSageLine());
    }

    if (neighbouring.contains(PORTAL)) {
      status.add("The portal leads to adventures, danger and treasures.");
    }

    if (current == DOOR) {
      status.add("This leads to the village.");
    }
    if (current == HOMEFLOOR && p1.position.y < 14) {
      status.add("You are home.");
    }
    if (current == FTREE) {
      status.add("You are in the orchard.");
      if (RND(10) == 1) {
        status.add("You found an apple.");
        p1.food += 1;
      }
    }
  }

  void moveMonsters(Grid dungeon) {
    List<GridPoint> nearbyMonsters = dungeon.getPointsOfTypeWithinDistance(
        p1.position, monsters, 5);

    nearbyMonsters
        .forEach((e) => print("${e.x},${e.y}    ${dungeon.getXY(e.x, e.y)}"));

    nearbyMonsters.forEach((GridPoint monsterPos) {
      int type = dungeon.get(monsterPos);
      int dx = 0;
      int dy = 0;

      if (monsterPos.x > p1.position.x)
        dx = -1;
      else if (monsterPos.x < p1.position.x) dx = -1;

      if (monsterPos.y > p1.position.y)
        dy = -1;
      else if (monsterPos.y < p1.position.y) dy = 1;
      //print("d $dx $dy");

      if (dx != 0 && dy != 0) {
        if (dungeon.getXY(monsterPos.x + dx, monsterPos.y) == MAINROUTE)
          dy = 0;
        else if (dungeon.getXY(monsterPos.x, monsterPos.y + dy) == MAINROUTE)
          dx = 0;
        else if (RND(2) == 1)
          dx = 0;
        else
          dy = 0;
      }
      //print("e $dx $dy");

      GridPoint newPosition =
      new GridPoint(monsterPos.x + dx, monsterPos.y + dy);

      if (dungeon.get(newPosition) == MAINROUTE) {
        dungeon.set(newPosition, type);
        dungeon.set(monsterPos, MAINROUTE);
      }
    });
  }
}

String getSageLine() {
  return "THE SAGE SAYS '${sagelines[RND(sagelines.length)]}'";
}
