import 'grid.dart';
import 'consts.dart';

Grid buildVillage() {
  Grid village = new Grid(24, 24, 102);
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
  return village;
}