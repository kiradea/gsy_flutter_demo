import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/anim_scan_demo_page.dart';
import 'package:gsy_flutter_demo/widget/canvas_click_demo_page.dart';

class NewCanvasClickDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }
}

class _NewCanvasClickDemoPageState extends State<NewCanvasClickDemoPage>
    with SingleTickerProviderStateMixin {
  Timer timer;

  AnimationController animationController;

  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(milliseconds: 800), (timer) {
      setState(() {});
    });
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    animation = Tween(begin: 0.0, end: 0.0).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("NewCanvasClickDemoPage"),
      ),
      body: Container(
        child: Center(),
      ),
    );
  }
}
