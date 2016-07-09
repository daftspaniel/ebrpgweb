import 'package:malison/malison.dart';
import 'player.dart';
import 'glyphcache.dart';
import 'consts.dart';
import 'grid.dart';
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

    terminal.writeAt(3, 36, 'LEVEL ${p1.level}');
    terminal.writeAt(15, 36, 'XP    ${p1.exp}');

    terminal.writeAt(3, 37, 'GOLD    ${p1.gold}');
    terminal.writeAt(15, 37, 'FOOD  ${p1.food}');

    for (int i = 0; i < p1.heartCount; i++) {
      terminal.drawGlyph(3 + i, 38, getGlyph(HEART));
    }
    for (int i = 0; i < p1.diamonds; i++) {
      terminal.drawGlyph(3 + i, 39, getGlyph(DIAMOND));
    }
    for (int i = p1.diamonds; i < (8 - p1.diamonds); i++) {
      terminal.drawGlyph(3 + i, 39, getGlyph(DIAMOND_GREY));
    }
  }

  void update(Grid currentroom, StatusList status, Player p1) {
    this
      ..clear()
      ..centerText(30, line);
    for (int i = 0; i < 80; i++) terminal.drawGlyph(i, 30, getGlyph(LINE));
    for (int i = 1; i < 10; i++)
      terminal.drawGlyph(25, 30 + i, getGlyph(VERTLINE));
    terminal.drawGlyph(25, 30, getGlyph(TJOINLINE));

    int ox = 28;
    int oy = 5;
    for (int yy = 0; yy < currentroom.height; yy++) {
      for (int xx = 0; xx < currentroom.width; xx++) {
        drawChar(ox + xx, oy + yy, currentroom[xx][yy]);
      }
    }
    terminal.writeAt(ox + p1.x, oy + p1.y, "@", Color.yellow, Color.purple);

    displayUserDetails(p1);

    int sy = 32;
    status.statusMessages
        .forEach((String status) => terminal.writeAt(27, sy++, status));
    render();
  }

  void drawChar(int x, int y, int index) {
    terminal.drawGlyph(x, y, getGlyph(index));
  }
}
