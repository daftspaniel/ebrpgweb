import 'util.dart';

class Grid {
  int _width;
  int _height;
  int _defaultValue;

  List<List<int>> _data;

  Grid(this._width, this._height, [this._defaultValue = 0]) {
    _data = new List<List<int>>(_width);

    for (int x = 0; x < _width; x++) {
      _data[x] = new List<int>.filled(_height, _defaultValue);
    }
  }

  num get width => _width;

  num get height => _height;

  operator [](int index) => _data[index];

  void setRect(int x, int y, int w, int h, int c) {
    for (int xx = x; xx < x + w; xx++) {
      for (int yy = y; yy < y + h; yy++) {
        _data[xx][yy] = c;
      }
    }
  }

  List<int> getNeighbours(int x, int y) {
    List<int> neighbours = new List<int>();
    neighbours
      ..add(_data[x - 1][y - 1])
      ..add(_data[x][y - 1])
      ..add(_data[x + 1][y - 1])
      ..add(_data[x - 1][y])
      ..add(_data[x + 1][y])
      ..add(_data[x - 1][y + 1])
      ..add(_data[x][y + 1])
      ..add(_data[x + 1][y + 1]);
    return neighbours;
  }

  void set(int i, int j, int k) {
    _data[i][j] = k;
  }

  int get(int i, int j) {
    if (i < 0 || j < 0 || i >= _width || j >= _height) return -1;
    return _data[i][j];
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
