import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/anim_progress_img_demo_page.dart';

class NewAlignDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewAlignDemoPageState();
  }
}

class _NewAlignDemoPageState extends State<NewAlignDemoPage>
    with SingleTickerProviderStateMixin {
  getAlign(x) {
    return Align(
      child: new Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      alignment: Alignment(cos(x * pi), sin(x * pi)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int size = 20;
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewAlignDemoPage"),
      ),
      body: new Container(
        alignment: Alignment(0, 0),
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: List.generate(size, (index) {
              return getAlign(index.toDouble() / size / 2);
            }),
          ),
        ),
      ),
    );
  }
}
