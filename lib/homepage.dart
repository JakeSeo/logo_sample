import 'package:flutter/material.dart';
import 'package:logo_sample/dev_jsds_logo.dart';
import 'package:logo_sample/dev_jsds_logo_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dev.jsds"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          DevJSDSLogo(size: 100),
          DevJSDSLogoAnimation(size: 100),
        ],
      ),
    );
  }
}
