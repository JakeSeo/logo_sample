import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logo_sample/dev_jsds_logo_painter.dart';

class DevJSDSLogo extends StatefulWidget {
  final double size;
  const DevJSDSLogo({Key? key, this.size = 300}) : super(key: key);

  @override
  State<DevJSDSLogo> createState() => _DevJSDSLogoState();
}

// Reference: https://stackoverflow.com/questions/50978603/how-to-animate-a-path-in-flutter

class _DevJSDSLogoState extends State<DevJSDSLogo>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: DevJSDSLogoPainter(scale: widget.size / 100),
      ),
    );
  }
}
