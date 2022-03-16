import 'package:flutter/material.dart';

class DevJSDSLogoPainter extends CustomPainter {
  DevJSDSLogoPainter({this.scale = 1});

  double scale;

  final double strokeWidth = 7;

  @override
  void paint(Canvas canvas, Size size) {
    var brushJDot = Paint()..color = Colors.grey;
    var offsetJDot = Offset(66.5 * scale, 16.5 * scale);

    var brushJHook = Paint();
    brushJHook.color = const Color(0xFF919191);
    brushJHook.style = PaintingStyle.stroke;
    brushJHook.strokeCap = StrokeCap.round;
    brushJHook.strokeWidth = strokeWidth * scale;

    var brushClip = Paint();
    brushClip.color = const Color(0xFFC4C4C4);
    brushClip.style = PaintingStyle.stroke;
    brushClip.strokeCap = StrokeCap.round;
    brushClip.strokeWidth = strokeWidth * scale;

    var pathJHook = Path();
    pathJHook.moveTo(66.5 * scale, 28 * scale);
    pathJHook.lineTo(66.5 * scale, 70 * scale);
    pathJHook.quadraticBezierTo(
        66.5 * scale, 86.5 * scale, 50 * scale, 86.5 * scale);
    pathJHook.quadraticBezierTo(
        33.5 * scale, 86.5 * scale, 33.5 * scale, 70 * scale);
    pathJHook.lineTo(33.5 * scale, 60 * scale);

    var pathClip = Path();
    pathClip.moveTo(43.5 * scale, 38 * scale);
    pathClip.lineTo(43.5 * scale, 70 * scale);
    pathClip.quadraticBezierTo(
        43.5 * scale, 76.5 * scale, 50 * scale, 76.5 * scale);
    pathClip.quadraticBezierTo(
        56.5 * scale, 76.5 * scale, 56.5 * scale, 70 * scale);
    pathClip.lineTo(56.5 * scale, 25 * scale);
    pathClip.quadraticBezierTo(
        56.5 * scale, 13.5 * scale, 45 * scale, 13.5 * scale);
    pathClip.quadraticBezierTo(
        33.5 * scale, 13.5 * scale, 33.5 * scale, 25 * scale);
    pathClip.lineTo(33.5 * scale, 70 * scale);
    pathClip.quadraticBezierTo(
        33.5 * scale, 86.5 * scale, 50 * scale, 86.5 * scale);
    pathClip.quadraticBezierTo(
        66.5 * scale, 86.5 * scale, 66.5 * scale, 70 * scale);
    pathClip.lineTo(66.5 * scale, 28 * scale);

    canvas.drawCircle(offsetJDot, (strokeWidth / 2) * scale, brushJDot);
    canvas.drawPath(pathClip, brushClip);
    canvas.drawPath(pathJHook, brushJHook);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
