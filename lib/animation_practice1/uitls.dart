import 'dart:math';

class Utils {
  static double range(double min, double max) =>
      Random().nextDouble() * (max - min) + min;
}
