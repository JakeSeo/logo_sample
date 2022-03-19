import 'package:flutter/material.dart';

class DevJSDSLogoPainter extends CustomPainter {
  DevJSDSLogoPainter({this.scale = 1});

  double scale;

  final double strokeWidth = 10;

  @override
  void paint(Canvas canvas, Size size) {
    var brushJDot = Paint()..color = Colors.grey;
    var offsetJDot = Offset(80 * scale, 20 * scale);

    var brushEye = Paint()..color = Colors.white;
    var offsetEye = Offset(82 * scale, 18 * scale);

    var brushJHook = Paint();
    brushJHook.color = const Color(0xFF919191);
    brushJHook.style = PaintingStyle.stroke;
    brushJHook.strokeCap = StrokeCap.round;
    brushJHook.strokeWidth = strokeWidth * scale;

    var brushShell = Paint();
    brushShell.color = const Color(0xFFC4C4C4);
    brushShell.style = PaintingStyle.stroke;
    brushShell.strokeCap = StrokeCap.round;
    brushShell.strokeWidth = strokeWidth * scale;

    var pathJHook = Path();
    pathJHook.moveTo(80 * scale, 35 * scale);
    pathJHook.lineTo(80 * scale, 50 * scale);
    pathJHook.quadraticBezierTo(80 * scale, 80 * scale, 50 * scale, 80 * scale);
    pathJHook.quadraticBezierTo(20 * scale, 80 * scale, 20 * scale, 50 * scale);
    pathJHook.lineTo(20 * scale, 45 * scale);

    var pathClip = Path();
    pathClip.moveTo(50 * scale, 50 * scale);
    pathClip.lineTo(50 * scale, 44.5 * scale);
    pathClip.quadraticBezierTo(
        50 * scale, 37 * scale, 42.5 * scale, 37 * scale);
    pathClip.quadraticBezierTo(
        35 * scale, 37 * scale, 35 * scale, 44.5 * scale);
    pathClip.lineTo(35 * scale, 50 * scale);
    pathClip.quadraticBezierTo(35 * scale, 65 * scale, 50 * scale, 65 * scale);
    pathClip.quadraticBezierTo(65 * scale, 65 * scale, 65 * scale, 50 * scale);
    pathClip.lineTo(65 * scale, 42.5 * scale);
    pathClip.quadraticBezierTo(
        65 * scale, 20 * scale, 42.5 * scale, 20 * scale);
    pathClip.quadraticBezierTo(
        20 * scale, 20 * scale, 20 * scale, 42.5 * scale);
    pathClip.lineTo(20 * scale, 50 * scale);
    pathClip.quadraticBezierTo(20 * scale, 80 * scale, 50 * scale, 80 * scale);
    pathClip.quadraticBezierTo(80 * scale, 80 * scale, 80 * scale, 50 * scale);
    pathClip.lineTo(80 * scale, 35 * scale);

    canvas.drawCircle(offsetJDot, (strokeWidth / 2) * scale, brushJDot);
    canvas.drawPath(pathClip, brushShell);
    canvas.drawPath(pathJHook, brushJHook);
    canvas.drawCircle(offsetEye, scale, brushEye);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
