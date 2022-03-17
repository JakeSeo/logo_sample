import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logo_sample/dev_jsds_logo_painter.dart';

class DevJSDSLogo extends StatefulWidget {
  const DevJSDSLogo({Key? key}) : super(key: key);

  @override
  State<DevJSDSLogo> createState() => _DevJSDSLogoState();
}

// Reference: https://stackoverflow.com/questions/50978603/how-to-animate-a-path-in-flutter

class _DevJSDSLogoState extends State<DevJSDSLogo>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    Tween<double> _rotationTween = Tween(begin: -pi, end: pi);
    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: DevJSDSLogoPainter(scale: 3),
      ),
    );
  }
}
