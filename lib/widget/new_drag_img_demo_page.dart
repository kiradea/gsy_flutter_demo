import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class NewDragImgDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewDragImgDemoPageState();
  }
}

class _NewDragImgDemoPageState extends State<NewDragImgDemoPage> {
  Matrix4 transform = Matrix4.diagonal3Values(1, 1, 1.0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewDragImgDemoPage"),
      ),
      body: Container(
        child: MatrixGestureDetector(
          onMatrixUpdate: (m, tm, sm, rm) {
            setState(() {
              transform = m;
            });
          },
          child: Transform(
            transform: transform,
            child: Image.asset(
              "static/gsy_cat.png",
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
    );
  }
}
