import 'dart:html';

import 'package:malison/malison.dart';

import 'character.dart';
import 'consts.dart';
import 'glyphcache.dart';
import 'gridpoint/grid.dart';
import 'player.dart';
import 'statuslist.dart';

class EightBitScreen {
  final int _columns = 80;
  final int _rows = 40;
  final CanvasElement _canvasTarget;

  RetroTerminal terminal;
  CanvasRenderingContext2D canvasContext;

  EightBitScreen(this._canvasTarget) {
    terminal = new RetroTerminal.dos(80, 40, _canvasTarget);
    canvasContext = _canvasTarget.getContext("2d");
  }

  void centerText(int row, String text) {
    int x = ((_columns - text.length) / 2).floor();
    terminal.writeAt(x, row, text);
  }

  void render() {
    terminal.render();
  }

  void clear() {
    terminal.clear();
  }

  void displayUserDetails(Player p1) {
    terminal.writeAt(3, 32, 'NAME  ${p1.name}');
    terminal.writeAt(3, 34, 'HP    ${p1.hp}');

    terminal.writeAt(3, 35, 'LEVEL ${p1.level}');
    terminal.writeAt(15, 35, 'XP    ${p1.exp}');

    terminal.writeAt(3, 36, 'GOLD    ${p1.gold}');
    terminal.writeAt(15, 36, 'FOOD  ${p1.food}');

    for (int i = 0; i < p1.heartCount; i++)
      terminal.drawGlyph(3 + i, 37, getGlyph(HEART));

    for (int i = 0; i < p1.diamonds; i++)
      terminal.drawGlyph(3 + i, 38, getGlyph(DIAMOND));

    for (int i = p1.diamonds; i < (8 - p1.diamonds); i++)
      terminal.drawGlyph(3 + i, 38, getGlyph(DIAMOND_GREY));
  }

  void update(Grid room, StatusList status, Player p1) {
    clear();

    drawRoom(room, p1);

    drawSeparators();

    displayUserDetails(p1);

    displayStatusMessages(status);

    render();
  }

  void updateArena(StatusList status, Player p1, Character m1) {
    clear();

    drawSeparators();

    displayUserDetails(p1);
    displayStatusMessages(status);
    render();

    canvasContext.scale(10, 10);
    drawPlayer(p1, 0, 1);
    terminal.writeAt(0, 1, "@", Color.yellow, Color.purple);
    terminal.drawGlyph(3, 1, getGlyph(EVILSAGE));
    render();
    canvasContext.scale(0, 0);
  }

  void drawRoom(Grid room, Player p1) {
    int ox = ((80 - room.width) / 2).truncate();
    int oy = ((30 - room.height) / 2).truncate();

    for (int yy = 0; yy < room.height; yy++)
      for (int xx = 0; xx < room.width; xx++)
        drawChar(ox + xx, oy + yy, room[xx][yy]);

    drawPlayer(p1, ox, oy);
  }

  void drawPlayer(Player p1, [int ox = 0, int oy = 0]) {
    terminal.writeAt(ox + p1.position.x, oy + p1.position.y, "@", Color.yellow,
        Color.purple);
  }

  void displayStatusMessages(StatusList status) {
    int sy = 32;
    status.statusMessages
        .forEach((String status) => terminal.writeAt(27, sy++, status));
  }

  void drawSeparators() {
    for (int i = 0; i < 80; i++) terminal.drawGlyph(i, 30, getGlyph(LINE));
    for (int i = 1; i < 10; i++)
      terminal.drawGlyph(25, 30 + i, getGlyph(VERTLINE));

    terminal.drawGlyph(25, 30, getGlyph(TJOINLINE));
  }

  void drawChar(int x, int y, int index) {
    terminal.drawGlyph(x, y, getGlyph(index));
  }
}
