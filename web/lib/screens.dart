import 'dart:html';

import 'consts.dart';
import 'screen.dart';

EightBitScreen get init {
  CanvasElement canvas = new CanvasElement();
  document.body.children.add(canvas);
  EightBitScreen screen = new EightBitScreen(canvas);
  return screen;
}

void drawTitleScreen(EightBitScreen screen) {
  for (int i = 0; i < 16; i++) {
    screen.terminal.writeAt(10 + i * 1, 5 + i, gametitle);
  }

  screen.centerText(27, "2016 Davy Mitchell");
  screen.centerText(31, "Do NOT COPY THIS CASSETTE");
  screen.centerText(35, "PRESS SPACEBAR TO BEGIN");

  screen.render();
}
