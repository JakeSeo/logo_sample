import 'package:flutter/material.dart';
import 'package:logo_sample/dev_jsds_logo_painter.dart';

class DevJSDSLogoAnimation extends StatefulWidget {
  final double size;
  const DevJSDSLogoAnimation({Key? key, this.size = 300}) : super(key: key);

  @override
  State<DevJSDSLogoAnimation> createState() => _DevJSDSLogoAnimationState();
}

class _DevJSDSLogoAnimationState extends State<DevJSDSLogoAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _paused = false;
  bool _forward = true;
  double _currentPercentage = 0;

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

  void pauseAnimation() {
    setState(() {
      _currentPercentage = _controller.value;
      _paused = true;
    });
    _controller.stop(canceled: false);
  }

  void resumeAnimation() async {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: DevJSDSLogoPainter(
            scale: widget.size / 100, animation: _controller),
      ),
    );
  }
}
