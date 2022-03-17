import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logo_sample/animation_practice1/my_animation.dart';
import 'package:logo_sample/animation_practice1/particle.dart';
import 'package:logo_sample/animation_practice1/uitls.dart';
import 'package:logo_sample/homepage.dart';

// Reference: https://www.youtube.com/watch?v=-LAXoH7hL_M
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
        for (int i = 0; i < particles.length; i++) {
          Particle p = particles[i];
          bool randomBool = Utils.range(0, 1) == 1;
          if (randomBool) {
            p.pos += Offset(p.dx, p.dy);
          } else {
            p.pos -= Offset(p.dx, p.dy);
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
