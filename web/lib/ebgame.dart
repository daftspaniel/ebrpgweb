import 'statuslist.dart';
import 'grid.dart';
import 'screen.dart';
import 'dart:async';
import 'package:malison/malison.dart';
import 'helpers.dart';
import 'glyphcache.dart';
import 'consts.dart';

class EBGame {
  final String line = "--" * 40;

  StatusList status;
  Grid village;
  EightBitScreen screen;

  bool screenUpdateRequired = true;

  EBGame(this.screen) {
    status = new StatusList();
    village = buildVillage();
    new Timer.periodic(new Duration(milliseconds: 1000), (timer) => update());
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
      screen.terminal.writeAt(ox + 5, oy + 5, "@", Color.yellow, Color.purple);
      for (int i = 0; i < 10; i++) {
        screen.terminal.drawGlyph(3 + i, 33, getGlyph(HEART));
        screen.terminal.drawGlyph(3 + i, 35, getGlyph(DIAMOND_GREY));
      }
      int sy = 32;
      status.statusMessages.forEach(
          (String status) => screen.terminal.writeAt(44, sy++, status));
      screen.render();
      screenUpdateRequired = false;
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
}
