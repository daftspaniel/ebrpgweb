import 'consts.dart';
import 'gridpoint/grid.dart';
import 'util.dart';
import 'gridpoint/gridpoint.dart';

int getRandomMonster() => monsters[RND(monsters.length - 1)];

Grid buildVillage() {
  Grid village = new Grid(24, 24, SHRUB);

  village..setRect(1, 1, 22, 22, GRASS)
         ..setRect(0, 0, 8, 8, BRICK)
         ..setRect(15, 15, 8, 4, BRICK)
         ..setRect(1, 1, 6, 6, HOMEFLOOR)
         ..setRect(16, 16, 6, 2, HOMEFLOOR)
         ..setRect(12, 5, 2, 17, MAINROUTE)
         ..setRect(8, 4, 9, 1, MAINROUTE)
         ..setRect(7, 4, 1, 1, DOOR)
         ..setRect(4, 2, 1, 1, CHEST);

  village.setRect(17, 3, 5, 5, WATER);
  village.setRect(20, 4, 1, 1, DUCK);
  village.setRect(17, 7, 1, 1, DUCK);
  village.setXY(18, 11, LLAMA);
  village.setXY(19, 11, LLAMA);
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
  village.setXY(8, 5, FLOWER);
  village.setRect(18, 13, 1, 2, FLOWER);
  village.setRect(2, 19, 6, 2, FLOWER);

  village.setXY(10, 8, ROCK);
  village.setXY(9, 9, ROCK);
  village.setXY(10, 9, PORTAL);
  village.setXY(10, 10, ROCK);
  village.setXY(18, 16, SHOPKEEPER);
  return village;
}

Grid buildDungeon(int width, int height) {
  Grid dungeon = new Grid(width, height, ROCK);

  int sx = 0;
  int sy = 0;
  int ex = width - 1;
  int ey = height - 1;
  int iterations = 5 + RND(5);

  for (int i = 0; i < iterations; i++) {
    dungeon.makePath(sx, sy, ex, ey, MAINROUTE);
  }

  for (int i = 0; i < width / 2; i++) {
    sx = RND(width);
    sy = RND(height);
    if (dungeon.getXY(sx, sy) == ROCK) {
      dungeon.setXY(sx, sy, GOLDORE);
    }
  }
  for (int i = 0; i < (width / 5) + RND(5); i++) {
    sx = RND(width);
    sy = RND(height);
    if (dungeon.getXY(sx, sy) == MAINROUTE) {
      dungeon.setXY(sx, sy, APRICOT);
    }
  }
  dungeon.buildSpaces(MAINROUTE);
  int bads = (dungeon.spaces.length / (dungeon.width / 3)).toInt();

  for (int i = 0; i < bads; i++) {
    GridPoint point = dungeon.getRandomFreePoint();
    if (point.x > 5 && point.y > 5) {
      dungeon.setXY(point.x, point.y, monsters[i % monsters.length]);
      //dungeon.set(point.x, point.y, getRandomMonster());
    }
  }

  dungeon.setXY(ex, ey, DIAMOND);

  return dungeon;
}

