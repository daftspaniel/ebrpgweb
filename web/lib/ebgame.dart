import 'statuslist.dart';
import 'grid.dart';
import 'screen.dart';
import 'dart:async';
import 'consts.dart';
import 'package:malison/malison.dart';

class EBGame {
  final String line = "--" * 40;

  StatusList status;
  Grid village;
  EightBitScreen screen;

  bool screenUpdateRequired = true;

  EBGame(this.screen) {
    status = new StatusList();
    buildVillage();
    new Timer.periodic(new Duration(milliseconds: 1000), (timer) => update());
  }

  void buildVillage() {
    village = new Grid(24, 24, 102);
    village.setRect(1, 1, 22, 22, GRASS);
    village.setRect(0, 0, 8, 8, BRICK);

    village.setRect(15, 15, 8, 4, BRICK);
    village.setRect(1, 1, 6, 6, HOMEFLOOR);
    village.setRect(16, 16, 6, 2, HOMEFLOOR);
    village.setRect(8, 4, 9, 1, MAINROUTE);
    village.setRect(12, 5, 2, 17, MAINROUTE);

    village.setRect(7, 4, 1, 1, DOOR);
    village.setRect(4, 2, 1, 1, CHEST);

    village.setRect(17, 3, 5, 5, WATER);
    village.setRect(20, 4, 1, 1, DUCK);
    village.setRect(17, 7, 1, 1, DUCK);
    village.set(18, 11, LLAMA);
    village.set(19, 11, LLAMA);
    village.setRect(13, 5, 1, 1, SAGE);

    village.setRect(11, 8, 4, 3, MAINROUTE);
    village.setRect(14, 20, 8, 1, MAINROUTE);
    village.setRect(20, 19, 1, 1, MAINROUTE);
    village.setRect(20, 18, 1, 1, DOOR);

    village.setRect(4, 15, 9, 1, MAINROUTE);
    village.setRect(11, 14, 1, 1, FARMER);

    village.setRect(2, 12, 6, 4, FTREE);
    village.setRect(3, 11, 4, 6, FTREE);

    village.setRect(10, 2, 2, 1, FLOWER);
    village.setRect(9, 6, 2, 1, FLOWER);
    village.set(8, 5, FLOWER);
    village.setRect(18, 13, 1, 2, FLOWER);
    village.setRect(2, 19, 6, 2, FLOWER);

    village.set(10, 8, ROCK);
    village.set(9, 9, ROCK);
    village.set(10, 9, PORTAL);
    village.set(10, 10, ROCK);
    village.set(18, 16, SHOPKEEPER);
  }

  update() {
    status.add("moo");
    drawRoom();
  }

  void drawRoom() {
    if (screenUpdateRequired) {
      screen
        ..clear()
        ..centerText(30, line);

      int ox = 28;
      int oy = 5;
      for (int yy = 0; yy < village.height; yy++) {
        for (int xx = 0; xx < village.width; xx++) {
          drawChar(ox + xx, oy + yy, village[xx][yy]);
        }
      }
      screen.terminal.writeAt(ox + 5, oy + 5, "@", Color.yellow, Color.purple);
      int sy = 31;
      status.statusMessages
          .forEach((String status) => screen.terminal.writeAt(0, sy++, status));
      screen.render();
      screenUpdateRequired = false;
    }
  }

  Map<int, Glyph> glyphCache = new Map<int, Glyph>();
  Glyph getGlyph(int index) {
    Glyph g;
    if (glyphCache.containsKey(index)) {
      return glyphCache[index];
    }
    if (index == BRICK) {
      g = new Glyph.fromCharCode(
          CharCode.boxDrawingsDoubleVerticalAndHorizontal,
          Color.red,
          Color.red);
    } else if (index == FTREE) {
      g = new Glyph.fromCharCode(
          CharCode.upwardsArrow, Color.green, Color.lightGreen);
    } else if (index == LLAMA) {
      g = new Glyph.fromCharCode(
          CharCode.pilcrow, Color.lightBrown, Color.lightGreen);
    } else if (index == SHRUB) {
      g = new Glyph.fromCharCode(
          CharCode.upwardsArrow, Color.lightGreen, Color.green);
    } else if (index == GRASS) {
      g = new Glyph.fromCharCode(
          CharCode.darkShade, Color.lightGreen, Color.green);
    } else if (index == ROCK) {
      g = new Glyph.fromCharCode(
          CharCode.darkShade, Color.lightGray, Color.darkGray);
    } else if (index == FLOWER) {
      g = new Glyph.fromCharCode(
          CharCode.whiteSunWithRays, Color.yellow, Color.lightGreen);
    } else if (index == HOMEFLOOR) {
      g = new Glyph.fromCharCode(
          CharCode.darkShade, Color.lightOrange, Color.orange);
    } else if (index == CHEST) {
      g = new Glyph.fromCharCode(
          CharCode.lowerHalfBlock, Color.brown, Color.orange);
    } else if (index == DOOR) {
      g = new Glyph.fromCharCode(
          CharCode.darkShade, Color.lightBrown, Color.brown);
    } else if (index == PORTAL) {
      g = new Glyph.fromCharCode(
          CharCode.inverseWhiteCircle, Color.aqua, Color.red);
    } else if (index == WATER) {
      g = new Glyph.fromCharCode(
          CharCode.mediumShade, Color.lightBlue, Color.blue);
    } else if (index == DUCK) {
      g = new Glyph.fromCharCode(
          CharCode.greekSmallLetterDelta, Color.lightBlue, Color.blue);
    } else if (index == MAINROUTE) {
      g = new Glyph.fromCharCode(
          CharCode.lightShade, Color.lightYellow, Color.lightYellow);
    } else if (index == FARMER || index == SHOPKEEPER || index == SAGE) {
      g = new Glyph.fromCharCode(
          CharCode.whiteSmilingFace, Color.red, Color.lightYellow);
    }
    glyphCache[index] = g;
    return g;
  }

  void drawChar(int x, int y, int index) {
    print(index);
    //if (index == 3) {
    //  screen.terminal.writeAt(x, y, " ", Color.green, Color.green);
    //} else if (index == 12 || index == 102 || ubde) {
    screen.terminal.drawGlyph(x, y, getGlyph(index));
    //} else {
    //screen.terminal.writeAt(x, y, index.toString()[0]);
    //}
  }
}
