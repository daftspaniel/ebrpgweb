import 'dart:html';
import 'statuslist.dart';
import 'grid.dart';
import 'screen.dart';
import 'dart:async';
import 'helpers.dart';
import 'consts.dart';
import 'player.dart';

class EBGame {
  EightBitScreen screen;
  StatusList status;

  Grid village;
  Player p1;

  bool screenUpdateRequired = true;

  EBGame(this.screen) {
    p1 = new Player();
    p1.x = 5;
    p1.y = 5;
    status = new StatusList();
    village = buildVillage();
    new Timer.periodic(new Duration(milliseconds: 100), (timer) => update());
    setControls();
  }

  void update() {
    drawRoom();
  }

  void drawRoom() {
    if (screenUpdateRequired) {
      screen.update(village, status, p1);
      screenUpdateRequired = false;
    }
  }

  void updateCharacters() {
    List<int> neighbouring = village.getNeighbours(p1.x, p1.y);
    if (neighbouring.contains(SHRUB)) {
      status.add("The trees are very thick and tall.");
    }
  }

  void setControls() {
    window.onKeyUp.listen((KeyboardEvent e) {
      int xdelta = 0;
      int ydelta = 0;
      if (e.keyCode == 38) {
        ydelta = -1;
      }
      if (e.keyCode == 40) {
        ydelta = 1;
      }
      if (e.keyCode == 39) {
        xdelta++;
      }
      if (e.keyCode == 37) {
        xdelta--;
      }

      int target = village.get(p1.x + xdelta, p1.y + ydelta);

      if (target != -1 && obstacles.indexOf(target) == -1) {
        p1.x += xdelta;
        p1.y += ydelta;

        updateCharacters();
        screenUpdateRequired = true;
      }
    });
  }
}
