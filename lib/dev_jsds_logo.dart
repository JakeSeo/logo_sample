import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logo_sample/dev_jsds_logo_painter.dart';

class DevJSDSLogo extends StatefulWidget {
  final double size;

  const DevJSDSLogo({Key? key, this.size = 300}) : super(key: key);

  @override
  State<DevJSDSLogo> createState() => _DevJSDSLogoState();
}

class _DevJSDSLogoState extends State<DevJSDSLogo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _paused = false;
  bool _forward = true;
  double _currentPercentage = 0;
  void _initAnimation() {
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(seconds: 2);
    _controller.addStatusListener((status) async {
      print(status);
      if (status == AnimationStatus.forward) {
        _forward = true;
        await Future.delayed(Duration(seconds: 1));
      } else if (status == AnimationStatus.reverse) {
        _forward = false;
        await Future.delayed(Duration(seconds: 1));
      }
    });
  }

  void _pauseAnimation() {
    setState(() {
      _currentPercentage = _controller.value;
      _paused = true;
    });
    _controller.stop(canceled: false);
  }

  void _resumeAnimation() async {
    setState(() {
      _paused = false;
    });
    print("${_forward}");
    _controller.value = _currentPercentage;
    // print("${_forward}");
    if (!_forward) {
      _controller.duration = const Duration(seconds: 2);
      await _controller.reverse();
      print("hello");
      _initAnimation();
      _controller.repeat(reverse: true);
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            painter: DevJSDSLogoPainter(_controller, widget.size / 100),
          ),
        ),
        ElevatedButton(
            onPressed: _paused ? _resumeAnimation : _pauseAnimation,
            child: Text(_paused ? "Play" : "Pause"))
      ],
    );
  }
}
