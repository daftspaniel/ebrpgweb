import 'dart:math';

import 'util.dart';

class GridPoint {
  int _x;
  int _y;

  int get x => _x;

  int get y => _y;

  GridPoint(this._x, this._y);
}

class Grid {
  int _width;
  int _height;
  int _defaultValue;

  List<List<int>> _data;
  List<GridPoint> _spaces;

  GridPoint getRandomFreePoint() => _spaces[RND(_spaces.length - 1)];

  get spaces => _spaces;

  num get width => _width;

  num get height => _height;

  operator [](int index) => _data[index];

  Grid(this._width, this._height, [this._defaultValue = 0]) {
    _data = new List<List<int>>(_width);
    _spaces = new List<GridPoint>();
    for (int x = 0; x < _width; x++) {
      _data[x] = new List<int>.filled(_height, _defaultValue);
    }
  }

  void buildSpaces(int spaceId) {
    _spaces?.clear();
    for (int xx = 0; xx < _width; xx++) {
      for (int yy = 0; yy < _height; yy++) {
        if (_data[xx][yy] == spaceId) {
          _spaces.add(new GridPoint(xx, yy));
        }
      }
    }
  }

  void setRect(int x, int y, int w, int h, int c) {
    for (int xx = x; xx < x + w; xx++) {
      for (int yy = y; yy < y + h; yy++) {
        _data[xx][yy] = c;
      }
    }
  }

  List<GridPoint> getPointsOfTypeWithinDistance(GridPoint origin,
      List<int> types, int maxDistance) {
    List<GridPoint> points = new List<GridPoint>();

    for (int xx = 0; xx < _width; xx++) {
      for (int yy = 0; yy < _height; yy++) {
        if (getDistance(origin, xx, yy) <= maxDistance &&
            types.contains(_data[xx][yy])
        ) {
          points.add(new GridPoint(xx, yy));
        }
      }
    }
    return points;
  }

  int getDistance(GridPoint origin, int xx, int yy) {
    int xdistance = (xx - origin.x).abs();
    int ydistance = (yy - origin.y).abs();
    int straightLineDistance = sqrt(pow(xdistance, 2) + pow(ydistance, 2))
        .toInt();
    return straightLineDistance;
  }

  List<int> getNeighbours(int x, int y) {
//    List<int> neighbours = new List<int>();
//    neighbours.addAll();
//    neighbours..add(_data[x - 1][y - 1])..add(_data[x][y - 1])..add(
//        _data[x + 1][y - 1])..add(_data[x - 1][y])..add(_data[x + 1][y])..add(
//        _data[x - 1][y + 1])..add(_data[x][y + 1])..add(_data[x + 1][y + 1]);
//
    return [_data[x - 1][y - 1], _data[x][y - 1],
    _data[x + 1][y - 1], _data[x - 1][y], _data[x + 1][y],
    _data[x - 1][y + 1], _data[x][y + 1], _data[x + 1][y + 1]
    ];
    //return neighbours;
  }

  void set(int i, int j, int k) {
    _data[i][j] = k;
  }

  int get(int i, int j) {
    if (i < 0 || j < 0 || i >= _width || j >= _height) return -1;
    return _data[i][j];
  }

  int gpget(GridPoint pos) {
    return get(pos.x, pos.y);
  }

  void gpset(GridPoint pos, int k) {
    set(pos.x, pos.y, k);
  }

  void makePath(int sx, int sy, int ex, int ey, int tile) {
    set(sx, sy, tile);
    int nextpath;

    while (sx != ex || sy != ey) {
      if (sx != ex) {
        nextpath = RND(8);
        if (sx + nextpath > ex) {
          nextpath = ex - sx;
        }
        for (int i = 0; i < (nextpath); i++) {
          sx += 1;
          set(sx, sy, tile);
        }
      }

      if (sy != ey) {
        nextpath = RND(8);
        if (sy + nextpath > ey) {
          nextpath = ey - sy;
        }
        for (int i = 0; i < nextpath; i++) {
          sy += 1;
          set(sx, sy, tile);
        }
      }
    } //while
  }
} //class
