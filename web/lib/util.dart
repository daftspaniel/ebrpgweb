import 'dart:math';

int RND(int maxv) {
  maxv = max(1, maxv);
  return new Random().nextInt(maxv);
}
