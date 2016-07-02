// Copyright (c) 2016, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'lib/screen.dart';
import 'lib/screens.dart';
import 'lib/consts.dart';
import 'lib/ebgame.dart';

void main() {
  EightBitScreen screen = init;
  var state = gameStates.GameOn;

  if (state == gameStates.TitleScreen) {
    drawTitleScreen(screen);
  } else if (state == gameStates.GameOn) {
    EBGame game = new EBGame(screen);
    game.drawRoom();
  }

}
