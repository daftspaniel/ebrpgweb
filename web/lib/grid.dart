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

  void set(int i, int j, int k) {
    _data[i][j] = k;
  }
}
