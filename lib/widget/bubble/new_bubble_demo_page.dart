import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:gsy_flutter_demo/widget/bubble/bubble_demo_page.dart';
import 'package:gsy_flutter_demo/widget/bubble/bubble_painter.dart';

class NewBubbleDemoPage extends StatelessWidget {
  final double bubbleHeight = 60;
  final double bubbleWidth = 120;
  final GlobalKey contentKey = GlobalKey();

  final GlobalKey button1Key = GlobalKey();
  final GlobalKey button2Key = GlobalKey();
  final GlobalKey button3Key = GlobalKey();
  final GlobalKey button4Key = GlobalKey();

  getX(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    double dx = renderBox.localToGlobal(Offset.zero).dx;
    return dx;
  }

  getY(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    double dy = renderBox.localToGlobal(Offset.zero).dy;
    return dy;
  }

  getWidth(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    return renderBox.size.width;
  }

  getHeight(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  bool isClient() {
    try {
      return Platform.isAndroid == true || Platform.isIOS == true;
    } catch (e) {
      return false;
    }
  }

  getY1() {
    if (isClient()) {
      return getY(button1Key) +
          getHeight(button1Key) -
          MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;
    } else {
      return getY(button1Key) + getHeight(button1Key);
    }
  }

  getY2() {
    if (isClient()) {
      return getY(button2Key) +
          getHeight(button2Key) / 2 -
          MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;
    } else {
      return getY(button2Key) + getHeight(button2Key) / 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("New_Bubble_Demo_page"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(15),
        child: new Stack(
          key: contentKey,
          children: [
            new MaterialButton(
              key: button1Key,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return BubbleDialog(
                        "Test1",
                        height: bubbleHeight,
                        width: bubbleWidth,
                        arrowLocation: ArrowLocation.TOP,
                        x: getX(button1Key) + getWidth(button1Key) / 2,
                        y: getY1(),
                      );
                    });
              },
              color: Colors.blue[700],
            ),
            new Positioned(
              child: new MaterialButton(
                key: button2Key,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return BubbleDialog(
                          "Test2",
                          height: bubbleHeight,
                          width: bubbleWidth,
                          arrowLocation: ArrowLocation.RIGHT,
                          x: getX(button2Key) - bubbleWidth,
                          y: getY2(),
                        );
                      });
                },
                color: Colors.green[50],
              ),
              left: MediaQuery.of(context).size.width / 2,
            )
          ],
        ),
      ),
    );
  }
}

class NewBubbleDialog extends StatelessWidget {
  final String text;

  final ArrowLocation arrowLocation;

  final double height;

  final double width;

  final double radious;

  final double x;

  final double y;

  final VoidCallback voidCallback;

  NewBubbleDialog(
    this.text, {
    this.width,
    this.height,
    this.radious = 4,
    this.arrowLocation = ArrowLocation.BOTTOM,
    this.voidCallback,
    this.x = 0,
    this.y = 0,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
    );
  }
}
