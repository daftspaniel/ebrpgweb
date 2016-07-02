import 'package:malison/malison.dart';

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
}
