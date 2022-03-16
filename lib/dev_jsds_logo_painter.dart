import 'package:flutter/material.dart';

class DevJSDSLogoPainter extends CustomPainter {
  DevJSDSLogoPainter({this.size = 1});

  double size;

  final double strokeWidth = 7;

  @override
  void paint(Canvas canvas, Size size) {
    var brushJDot = Paint()..color = Colors.grey;
    var offsetJDot = Offset(66.5 * this.size, 16.5 * this.size);

    var brushJHook = Paint();
    brushJHook.color = const Color(0xFF919191);
    brushJHook.style = PaintingStyle.stroke;
    brushJHook.strokeCap = StrokeCap.round;
    brushJHook.strokeWidth = strokeWidth * this.size;

    var brushClip = Paint();
    brushClip.color = const Color(0xFFC4C4C4);
    brushClip.style = PaintingStyle.stroke;
    brushClip.strokeCap = StrokeCap.round;
    brushClip.strokeWidth = strokeWidth * this.size;

    var pathJHook = Path();
    pathJHook.moveTo(66.5 * this.size, 28 * this.size);
    pathJHook.lineTo(66.5 * this.size, 70 * this.size);
    pathJHook.quadraticBezierTo(
        66.5 * this.size, 86.5 * this.size, 50 * this.size, 86.5 * this.size);
    pathJHook.quadraticBezierTo(
        33.5 * this.size, 86.5 * this.size, 33.5 * this.size, 70 * this.size);
    pathJHook.lineTo(33.5 * this.size, 60 * this.size);

    var pathClip = Path();
    pathClip.moveTo(43.5 * this.size, 38 * this.size);
    pathClip.lineTo(43.5 * this.size, 70 * this.size);
    pathClip.quadraticBezierTo(
        43.5 * this.size, 76.5 * this.size, 50 * this.size, 76.5 * this.size);
    pathClip.quadraticBezierTo(
        56.5 * this.size, 76.5 * this.size, 56.5 * this.size, 70 * this.size);
    pathClip.lineTo(56.5 * this.size, 25 * this.size);
    pathClip.quadraticBezierTo(
        56.5 * this.size, 13.5 * this.size, 45 * this.size, 13.5 * this.size);
    pathClip.quadraticBezierTo(
        33.5 * this.size, 13.5 * this.size, 33.5 * this.size, 25 * this.size);
    pathClip.lineTo(33.5 * this.size, 70 * this.size);
    pathClip.quadraticBezierTo(
        33.5 * this.size, 86.5 * this.size, 50 * this.size, 86.5 * this.size);
    pathClip.quadraticBezierTo(
        66.5 * this.size, 86.5 * this.size, 66.5 * this.size, 70 * this.size);
    pathClip.lineTo(66.5 * this.size, 28 * this.size);

    canvas.drawCircle(offsetJDot, (strokeWidth / 2) * this.size, brushJDot);
    canvas.drawPath(pathClip, brushClip);
    canvas.drawPath(pathJHook, brushJHook);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
