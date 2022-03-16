import 'package:flutter/material.dart';
import 'package:logo_sample/dev_jsds_logo_painter.dart';

class DevJSDSLogo extends StatelessWidget {
  const DevJSDSLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: DevJSDSLogoPainter(),
      ),
    );
  }
}
