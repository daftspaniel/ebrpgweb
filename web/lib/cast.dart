import 'consts.dart';
import 'grid.dart';
import 'player.dart';
import 'statuslist.dart';
import 'util.dart';

class Cast {
  Grid room;
  Player p1;
  StatusList status;

  get currentPlayerLocation {
    return room.get(p1.x, p1.y);
  }

  Cast(this.p1, this.room, this.status) {}

  void update() {
    List<int> neighbouring = room.getNeighbours(p1.x, p1.y);
    int current = room.get(p1.x, p1.y);

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
    if (current == HOMEFLOOR && p1.y < 14) {
      status.add("You are home.");
    }
    if (current == FTREE) {
      status.add("You are in the orchard.");
      if (RND(7) == 1) {
        status.add("You found an apple.");
      }
      p1.food += 1;
    }
  }

  void moveMonsters() {}
}

String getSageLine() {
  return "THE SAGE SAYS '${sagelines[RND(sagelines.length)]}'";
}
