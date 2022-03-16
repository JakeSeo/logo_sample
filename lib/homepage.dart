import 'package:flutter/material.dart';
import 'package:logo_sample/clock_view.dart';
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
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xFF2D2F41),
        child: DevJSDSLogo(),
      ),
    );
  }
}
