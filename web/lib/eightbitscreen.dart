import 'package:malison/malison.dart';

import 'consts.dart';
import 'glyphcache.dart';
import 'grid.dart';
import 'player.dart';
import 'statuslist.dart';

class EightBitScreen {
  final int columns = 80;
  final int rows = 40;

  RetroTerminal terminal;

  EightBitScreen(canvasTarget) {
    terminal = new RetroTerminal.dos(80, 40, canvasTarget);
  }

  void centerText(int row, String text) {
    int x = ((columns - text.length) / 2).floor();
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
    this
      ..clear();

    drawRoom(room, p1);

    drawSeparators();

    displayUserDetails(p1);

    displayStatusMessages(status);

    render();
  }

  void updateArena(StatusList status, Player p1) {
    this
      ..clear();

    drawSeparators();

    displayUserDetails(p1);

    displayStatusMessages(status);

    render();
  }

  void drawRoom(Grid room, Player p1) {
    int ox = ((80 - room.width) / 2).truncate();
    int oy = ((30 - room.height) / 2).truncate();

    for (int yy = 0; yy < room.height; yy++)
      for (int xx = 0; xx < room.width; xx++)
        drawChar(ox + xx, oy + yy, room[xx][yy]);

    terminal.writeAt(ox + p1.position.x, oy + p1.position.y, "@", Color.yellow,
        Color.purple);
  }

  void displayStatusMessages(StatusList status) {
    int sy = 32;
    status.statusMessages
        .forEach((String status) => terminal.writeAt(27, sy++, status));
  }

  void drawSeparators() {

    for (int i = 0; i < 80; i++)
      terminal.drawGlyph(i, 30, getGlyph(LINE));
    for (int i = 1; i < 10; i++)
      terminal.drawGlyph(25, 30 + i, getGlyph(VERTLINE));

    terminal.drawGlyph(25, 30, getGlyph(TJOINLINE));
  }

  void drawChar(int x, int y, int index) {
    terminal.drawGlyph(x, y, getGlyph(index));
  }
}
