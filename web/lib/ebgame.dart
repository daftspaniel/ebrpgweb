import 'dart:async';
import 'dart:html';

import 'arena.dart';
import 'cast.dart';
import 'consts.dart';
import 'eightbitscreen.dart';
import 'gridpoint/grid.dart';
import 'gridpoint/gridpoint.dart';
import 'helpers.dart';
import 'player.dart';
import 'statuslist.dart';

class EightBitGame {

  StatusList status = new StatusList();
  Player p1 = new Player(new GridPoint(5, 5));
  EightBitScreen screen;

  bool screenUpdateRequired = true;
  bool inVillage = true;
  bool inArena = false;

  Arena fightArena;
  Grid village;
  Grid dungeon;
  Grid currentRoom;

  Cast characters;
  Cast dungeonMonsters;

  Timer gamePulse;
  Timer statusPulse;

  EightBitGame(this.screen) {
    village = buildVillage();
    currentRoom = village;
    characters = new Cast(p1, village, status);
    dungeonMonsters = new Cast(p1, dungeon, status);

    setupTimers();
    setupControls();
  }

  void setupTimers() {
    gamePulse =
    new Timer.periodic(new Duration(milliseconds: 100), (timer) => update());
    statusPulse = new Timer.periodic(
        new Duration(milliseconds: 4000), (timer) => updateStatus());
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
        p1.position = new GridPoint(0, 0);
        screenUpdateRequired = true;
        status.add("You are in the dungeon.");
      }
    }
    else if (inArena) {
      print("Arena");
      status.add("The fight has begun!");

      fightArena = new Arena(p1, GHOST);
      status.add("You are fighting a " + fightArena.monster.name);
    }
    else {
      if (currentRoom.get(p1.position) == DIAMOND) {
        currentRoom = village;
        inVillage = true;
        p1.position = new GridPoint(5, 5);
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
      if (!inArena)
        screen.update(currentRoom, status, p1);
      else
        screen.updateArena(status, p1, fightArena.monster);
      screenUpdateRequired = false;
    }
  }

  void setupControls() {
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
    int target = currentRoom.getXY(
        p1.position.x + xdelta, p1.position.y + ydelta);

    if (target != -1 && obstacles.indexOf(target) == -1) {
      movePlayer(xdelta, ydelta);
    }
  }

  void movePlayer(int xdelta, int ydelta) {
    p1.position.addDeltas(xdelta, ydelta);
    screenUpdateRequired = true;

    if (inVillage) {
      characters.update();
    }
    else {
      int current = currentRoom.get(p1.position);
      if (current == APRICOT) {
        status.add("You found an apricot.");
        p1.food += 1;
        currentRoom.set(p1.position, MAINROUTE);
      }
      dungeonMonsters.moveMonsters(currentRoom);

      currentRoom.getNeighbours(p1.position).forEach((int item) {
        if (monsters.contains(item))
          print(item);
        inArena = true;
      });
    }
  }
}
