import 'package:flutter/material.dart';
import 'package:logo_sample/animation_practice1/particle.dart';

class MyAnimation extends CustomPainter {
  List<Particle> particles;

  MyAnimation(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    // draw the particles
    for (var p in particles) {
      canvas.drawCircle(p.pos, p.radius, Paint()..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
