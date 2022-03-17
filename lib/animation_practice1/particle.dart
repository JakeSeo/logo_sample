import 'package:flutter/material.dart';
import 'package:logo_sample/animation_practice1/uitls.dart';

class Particle {
  late double radius;
  late Color color;
  late Offset pos;
  late double dx;
  late double dy;
  Particle() {
    radius = Utils.range(3, 10);
    color = Colors.black26;
    final x = Utils.range(0, 400);
    final y = Utils.range(0, 500);
    pos = Offset(x, y);
    dx = Utils.range(-0.1, 0.1);
    dy = Utils.range(-0.1, 0.1);
  }
}
