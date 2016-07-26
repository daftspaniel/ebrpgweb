import 'dart:async';
import 'dart:html';

import 'cast.dart';
import 'consts.dart';
import 'grid.dart';
import 'helpers.dart';
import 'player.dart';
import 'screen.dart';
import 'statuslist.dart';

class EightBitGame {

  StatusList status = new StatusList();
  Player p1 = new Player(5, 5);
  EightBitScreen screen;

  bool screenUpdateRequired = true;
  bool inVillage = true;

  Grid village;
  Grid dungeon;
  Grid currentRoom;

  Cast characters;
  Cast dungeonMonsters;

  EightBitGame(this.screen) {
    village = buildVillage();
    currentRoom = village;
    characters = new Cast(p1, village, status);
    dungeonMonsters = new Cast(p1, dungeon, status);

    new Timer.periodic(new Duration(milliseconds: 100), (timer) => update());
    new Timer.periodic(
        new Duration(milliseconds: 4000), (timer) => updateStatus());
    setControls();
  }

  void updateStatus() {
    screenUpdateRequired = true;
    status.add("");
  }

  void update() {
    if (inVillage) {
      if (characters.currentPlayerLocation == PORTAL) {
        dungeon = buildDungeon(45, 25);
        currentRoom = dungeon;
        inVillage = false;
        p1.x = 0;
        p1.y = 0;
        screenUpdateRequired = true;
        status.add("You are in the dungeon.");
      }
    }
    else {
      if (currentRoom.get(p1.x, p1.y) == DIAMOND) {
        currentRoom = village;
        inVillage = true;
        p1.x = 5;
        p1.y = 5;
        screenUpdateRequired = true;
        status.clear();
        p1.diamonds++;
        status.add("You are in the village.");
      }
    }
    drawRoom();
  }

  void drawRoom() {
    if (screenUpdateRequired) {
      screen.update(currentRoom, status, p1);
      screenUpdateRequired = false;
    }
  }

  void setControls() {
    window.onKeyDown.listen((KeyboardEvent e) {
      inGameKeyHandler(e);
    });
  }

  void inGameKeyHandler(KeyboardEvent e) {
    int xdelta = 0;
    int ydelta = 0;

    if (e.keyCode == 38) {
      ydelta = -1;
    }
    else if (e.keyCode == 40) {
      ydelta = 1;
    }
    else if (e.keyCode == 39) {
      xdelta++;
    }
    else if (e.keyCode == 37) {
      xdelta--;
    }

    handlePlayerMove(xdelta, ydelta);
  }

  void handlePlayerMove(int xdelta, int ydelta) {
    int target = currentRoom.get(p1.x + xdelta, p1.y + ydelta);

    if (target != -1 && obstacles.indexOf(target) == -1) {
      movePlayer(xdelta, ydelta);
    }
  }

  void movePlayer(int xdelta, int ydelta) {
    p1.x += xdelta;
    p1.y += ydelta;
    screenUpdateRequired = true;

    if (inVillage) {
      characters.update();
    }
    else {
      int current = currentRoom.get(p1.x, p1.y);
      if (current == APRICOT) {
        status.add("You found an apricot.");
        p1.food += 1;
        currentRoom.set(p1.x, p1.y, MAINROUTE);
      }
      dungeonMonsters.moveMonsters(currentRoom);
    }
  }
}
