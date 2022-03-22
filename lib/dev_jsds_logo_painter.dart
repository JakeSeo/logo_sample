import 'dart:ui';

import 'package:flutter/material.dart';

class DevJSDSLogoPainter extends CustomPainter {
  final LENGTH_J_HOOK = 116.76515197753906;
  final LENGTH_J_HOOK_LONG = 151.76515197753906;

  final Animation<double> _animation;

  DevJSDSLogoPainter(this._animation, this.scale) : super(repaint: _animation);

  double scale;

  final double strokeWidth = 10;

  Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);

        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  Path _createPathJHook(double startingPointX) {
    var pathJHook = Path();
    pathJHook.moveTo(80 * scale, startingPointX * scale);
    pathJHook.lineTo(80 * scale, 50 * scale);
    pathJHook.quadraticBezierTo(80 * scale, 80 * scale, 50 * scale, 80 * scale);
    pathJHook.quadraticBezierTo(20 * scale, 80 * scale, 20 * scale, 50 * scale);
    pathJHook.lineTo(20 * scale, 45 * scale);
    return pathJHook;
  }

  Path _createPathShell() {
    var pathShell = Path();
    pathShell.moveTo(50 * scale, 50 * scale);
    pathShell.lineTo(50 * scale, 44.5 * scale);
    pathShell.quadraticBezierTo(
        50 * scale, 37 * scale, 42.5 * scale, 37 * scale);
    pathShell.quadraticBezierTo(
        35 * scale, 37 * scale, 35 * scale, 44.5 * scale);
    pathShell.lineTo(35 * scale, 50 * scale);
    pathShell.quadraticBezierTo(35 * scale, 65 * scale, 50 * scale, 65 * scale);
    pathShell.quadraticBezierTo(65 * scale, 65 * scale, 65 * scale, 50 * scale);
    pathShell.lineTo(65 * scale, 42.5 * scale);
    pathShell.quadraticBezierTo(
        65 * scale, 20 * scale, 42.5 * scale, 20 * scale);
    pathShell.quadraticBezierTo(
        20 * scale, 20 * scale, 20 * scale, 42.5 * scale);
    pathShell.lineTo(20 * scale, 50 * scale);
    pathShell.quadraticBezierTo(20 * scale, 80 * scale, 50 * scale, 80 * scale);
    pathShell.quadraticBezierTo(80 * scale, 80 * scale, 80 * scale, 50 * scale);
    pathShell.lineTo(80 * scale, 35 * scale);
    return pathShell;
  }

  double _getPercentageJHook(double percentage) {
    if (percentage < 0.6) {
      return 0;
    }
    return (percentage - 0.6) / 0.4;
  }

  double _getPercentageShell(double percentage) {
    if (percentage >= 0.6) {
      return 1;
    }
    return percentage / 0.6;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    var brushJDot = Paint()..color = const Color(0xFF919191);
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

    double percentageJHook = _getPercentageJHook(animationPercent);
    double percentageShell = _getPercentageShell(animationPercent);

    double startingPointXJHook =
        percentageJHook * LENGTH_J_HOOK_LONG > LENGTH_J_HOOK
            ? (LENGTH_J_HOOK_LONG - LENGTH_J_HOOK) -
                (LENGTH_J_HOOK_LONG - (percentageJHook * LENGTH_J_HOOK_LONG))
            : 0;

    Path pathJHook = createAnimatedPath(
        _createPathJHook(startingPointXJHook), percentageJHook);
    Path pathShell = createAnimatedPath(_createPathShell(), percentageShell);

    var brushEyeCover = Paint();
    brushEyeCover.color = const Color(0xFF919191);
    brushEyeCover.style = PaintingStyle.stroke;
    brushEyeCover.strokeWidth = strokeWidth * scale;

    Path pathEyeCover = Path();
    pathEyeCover.moveTo(80 * scale, 0 * scale);
    pathEyeCover.lineTo(80 * scale, 35 * scale);
    canvas.drawPath(pathShell, brushShell);
    // canvas.drawPath(pathEyeCover, brushEyeCover);
    if (percentageJHook > 0) {
      canvas.drawPath(pathJHook, brushJHook);
    }
    if (startingPointXJHook >= offsetJDot.dy) {
      canvas.drawCircle(offsetJDot, (strokeWidth / 2) * scale, brushJDot);
      canvas.drawCircle(offsetEye, scale, brushEye);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
