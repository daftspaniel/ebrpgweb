import 'dart:math';

class GridPoint {
  int _x;
  int _y;

  int get x => _x;

  int get y => _y;

  GridPoint(this._x, this._y);

  int getDistanceTo(int xx, int yy) {
    int xdistance = (xx - _x).abs();
    int ydistance = (yy - _y).abs();
    int straightLineDistance = sqrt(pow(xdistance, 2) + pow(ydistance, 2))
        .toInt();
    return straightLineDistance;
  }

  void addDeltas(int xDelta, int yDelta) {
    _x += xDelta;
    _y += yDelta;
  }
}