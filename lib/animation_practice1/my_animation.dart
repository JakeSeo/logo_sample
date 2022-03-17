import 'package:flutter/material.dart';
import 'package:logo_sample/animation_practice1/particle.dart';

class MyAnimation extends CustomPainter {
  List<Particle> particles;

  MyAnimation(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    const radius = 100.0;
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(c, radius, paint);

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
