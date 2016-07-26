import 'package:malison/malison.dart';

import 'consts.dart';

Map<int, Glyph> glyphCache = new Map<int, Glyph>();
const Color GROUND = Color.lightYellow;

Glyph getGlyph(int index) {
  Glyph g;
  if (glyphCache.containsKey(index)) {
    return glyphCache[index];
  }
  if (index == BRICK) {
    g = new Glyph.fromCharCode(
        CharCode.boxDrawingsDoubleVerticalAndHorizontal, Color.red, Color.red);
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
  } else if (index == GOLDORE) {
    g = new Glyph.fromCharCode(
        CharCode.darkShade, Color.yellow, Color.darkYellow);
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
  } else if (index == VERTLINE) {
    g = new Glyph.fromCharCode(
        CharCode.boxDrawingsDoubleVertical, Color.lightGreen, Color.darkYellow);
  } else if (index == LINE) {
    g = new Glyph.fromCharCode(CharCode.boxDrawingsDoubleHorizontal,
        Color.lightGreen, Color.darkYellow);
  } else if (index == HEART) {
    g = new Glyph.fromCharCode(CharCode.blackHeartSuit, Color.red, Color.black);
  } else if (index == DIAMOND) {
    g = new Glyph.fromCharCode(
        CharCode.blackDiamondSuit, Color.lightBlue, GROUND);
  } else if (index == DIAMOND_GREY) {
    g = new Glyph.fromCharCode(
        CharCode.blackDiamondSuit, Color.lightGray, Color.black);
  } else if (index == TJOINLINE) {
    g = new Glyph.fromCharCode(CharCode.boxDrawingsDoubleDownAndHorizontal,
        Color.lightGreen, Color.darkYellow);
  } else if (index == MAINROUTE) {
    g = new Glyph.fromCharCode(
        CharCode.lightShade, GROUND, GROUND);
  } else if (index == APRICOT) {
    g = new Glyph.fromCharCode(
        CharCode.degreeSign, Color.orange, GROUND);
  } else if (index == SNAKE) {
    g = new Glyph.fromCharCode(
        CharCode.squareRoot, Color.green, GROUND);
  } else if (index == BLOB) {
    g = new Glyph.fromCharCode(
        CharCode.blackSmilingFace, Color.green, GROUND);
  } else if (index == GHOST) {
    g = new Glyph.fromCharCode(
        CharCode.whiteSmilingFace, Color.white, GROUND);
  } else if (index == PHANTOM) {
    g = new Glyph.fromCharCode(
        CharCode.downwardsArrow, Color.darkBlue, GROUND);
  } else if (index == SNAIL) {
    g = new Glyph.fromCharCode(
        CharCode.greekCapitalLetterOmega, Color.darkGold, GROUND);
  } else if (index == NINJA) {
    g = new Glyph.fromCharCode(
        CharCode.femaleSign, Color.purple, GROUND);
  } else if (index == SPIDER) {
    g = new Glyph.fromCharCode(
        CharCode.whiteSunWithRays, Color.lightPurple, GROUND);
  } else if (index == HEDGE) {
    g = new Glyph.fromCharCode(
        CharCode.blackSpadeSuit, Color.green, GROUND);
  } else if (index == EVILSAGE) {
    g = new Glyph.fromCharCode(
        CharCode.whiteSmilingFace, Color.red, GROUND);
  } else if (index == FARMER || index == SHOPKEEPER || index == SAGE) {
    g = new Glyph.fromCharCode(
        CharCode.whiteSmilingFace, Color.red, GROUND);
  }
  glyphCache[index] = g;
  return g;
}
