import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logo_sample/animation_practice1/animation_widget.dart';
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Overlay Animation"),
        ),
        body: Container(
          child: Container(
              child: Stack(
            children: [
              _buildListView(),
              AnimationWidget(),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildListView() {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];
    final List<Color> colors = <Color>[
      Colors.amber.shade600,
      Colors.amber.shade500,
      Colors.amber.shade400,
      Colors.amber.shade100,
      Colors.amber.shade600,
      Colors.amber.shade500,
    ];
    return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: colors[index],
          child: Center(
            child: Text('Entry ${entries[index]}'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
