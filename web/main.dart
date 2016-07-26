// Copyright (c) 2016, Davy Mitchell. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:async';
import 'dart:html';

import 'lib/consts.dart';
import 'lib/ebgame.dart';
import 'lib/screen.dart';
import 'lib/screens.dart';

EightBitScreen screen = init;
gameStates state = gameStates.GameOn;
gameStates nextState = gameStates.TitleScreen;

void main() {

  window.onKeyDown.listen(titleScreenKeyHandler);

  new Timer.periodic(new Duration(milliseconds: 1000), gameStateChangeHandler);
}

titleScreenKeyHandler(KeyboardEvent e) {
  if (e.keyCode == KeyCode.SPACE) {
    nextState = gameStates.GameOn;
  }
}

gameStateChangeHandler(timer) {
  if (nextState == state) return;

  if (nextState == gameStates.TitleScreen) {
    drawTitleScreen(screen);
  } else if (nextState == gameStates.GameOn) {
    EightBitGame game = new EightBitGame(screen);
    game.drawRoom();
  }
  state = nextState;
}
