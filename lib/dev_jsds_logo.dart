import 'package:flutter/material.dart';
import 'package:logo_sample/dev_jsds_logo_painter.dart';

class DevJSDSLogo extends StatefulWidget {
  final double size;

  const DevJSDSLogo({Key? key, this.size = 300}) : super(key: key);

  @override
  State<DevJSDSLogo> createState() => _DevJSDSLogoState();
}

class _DevJSDSLogoState extends State<DevJSDSLogo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: DevJSDSLogoPainter(scale: widget.size / 100),
      ),
    );
  }
}
