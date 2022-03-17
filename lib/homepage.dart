import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logo_sample/animation_practice1/animation_widget.dart';
import 'package:logo_sample/custom_paint_practice1/clock_view.dart';
import 'package:logo_sample/dev_jsds_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Overlay Animation"),
      ),
      body: Container(
        child: Container(
            child: Stack(
          children: [
            AnimationWidget(),
          ],
        )),
      ),
    );
  }
}
