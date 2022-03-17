import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logo_sample/animation_practice1/particle.dart';
import 'package:logo_sample/homepage.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  late Timer timer;
  final List<Particle> particles =
      List<Particle>.generate(100, (index) => Particle());

  @override
  void initState() {
    super.initState();
    Duration duration = const Duration(milliseconds: 1000 ~/ 60);
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        // TODO: update animation
        for (int i = 0; i < particles.length; i++) {
          Particle p = particles[i];
          p.pos += Offset(p.dx, p.dy);
          if (p.pos.dx + p.radius < 0 || p.pos.dy + p.radius < 0) {
            particles.removeAt(i);
            i--;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        child: CustomPaint(
          child: Container(),
          painter: MyAnimation(particles),
        ),
      ),
    );
  }
}
