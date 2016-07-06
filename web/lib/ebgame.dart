import 'dart:html';
import 'statuslist.dart';
import 'grid.dart';
import 'screen.dart';
import 'dart:async';
import 'package:malison/malison.dart';
import 'helpers.dart';
import 'glyphcache.dart';
import 'consts.dart';
import 'player.dart';

class EBGame {
  final String line = "--" * 40;

  StatusList status;
  Grid village;
  EightBitScreen screen;
  Player p1;

  bool screenUpdateRequired = true;
  List<int> obstacles = [
    BRICK,
    SHRUB,
    FLOWER,
    WATER,
    FARMER,
    SAGE,
    LLAMA,
    SHOPKEEPER,
    DUCK,
    ROCK
  ];

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
    status.add("moo");
    drawRoom();
  }

  void drawRoom() {
    if (screenUpdateRequired) {
      screen
        ..clear()
        ..centerText(30, line);
      for (int i = 0; i < 80; i++)
        screen.terminal.drawGlyph(i, 30, getGlyph(LINE));
      for (int i = 1; i < 10; i++)
        screen.terminal.drawGlyph(41, 30 + i, getGlyph(VERTLINE));
      screen.terminal.drawGlyph(41, 30, getGlyph(TJOINLINE));
      int ox = 28;
      int oy = 5;
      for (int yy = 0; yy < village.height; yy++) {
        for (int xx = 0; xx < village.width; xx++) {
          drawChar(ox + xx, oy + yy, village[xx][yy]);
        }
      }
      screen.terminal
          .writeAt(ox + p1.x, oy + p1.y, "@", Color.yellow, Color.purple);
      displayUserDetails();
      int sy = 32;
      status.statusMessages.forEach(
          (String status) => screen.terminal.writeAt(44, sy++, status));
      screen.render();
      screenUpdateRequired = false;
    }
  }

  void displayUserDetails() {
    screen.terminal.writeAt(3, 32, 'NAME  ${p1.name}');
    screen.terminal.writeAt(3, 34, 'HP    ${p1.hp}');

    screen.terminal.writeAt(3, 36, 'LEVEL ${p1.level}');
    screen.terminal.writeAt(15, 36, 'XP    ${p1.exp}');

    screen.terminal.writeAt(3, 37, 'GOLD    ${p1.gold}');
    screen.terminal.writeAt(15, 37, 'FOOD    ${p1.food}');

    for (int i = 0; i < p1.heartCount; i++) {
      screen.terminal.drawGlyph(3 + i, 38, getGlyph(HEART));
    }
    for (int i = 0; i < p1.diamonds; i++) {
      screen.terminal.drawGlyph(3 + i, 39, getGlyph(DIAMOND));
    }
    for (int i = p1.diamonds; i < (10 - p1.diamonds); i++) {
      screen.terminal.drawGlyph(3 + i, 39, getGlyph(DIAMOND_GREY));
    }
  }

  void drawChar(int x, int y, int index) {
    //print(index);
    //if (index == 3) {
    //  screen.terminal.writeAt(x, y, " ", Color.green, Color.green);
    //} else if (index == 12 || index == 102 || ubde) {
    screen.terminal.drawGlyph(x, y, getGlyph(index));
    //} else {
    //screen.terminal.writeAt(x, y, index.toString()[0]);
    //}
  }

  void updateCharacters() {
    List<int> neighbouring = village.getNeighbours(p1.x, p1.y);
    if (neighbouring.contains(SHRUB)) {
      status.add("The trees are very thick and tall.");
    }
  }
//  def UpdateCharacters(self):"The trees are very thick and tall."
//
//        self.PrevText = self.TEXT
//  self.TEXT = ""
//  c = self.cur.getc(self.p1.px, self.p1.py)
//  neighbouring = self.cur.getneigh(self.p1.px, self.p1.py)
//  #print(neighbouring)
//  if SHRUB in neighbouring:
//  self.AddStatus("The trees are very thick and tall.")

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
