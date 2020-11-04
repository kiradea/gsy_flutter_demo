import 'package:flutter/material.dart';

class NewFloatingTouchDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewFloatingTouchDemoPageState();
  }
}

class _NewFloatingTouchDemoPageState extends State<NewFloatingTouchDemoPage> {
  Offset offset = Offset(200, 200);

  final double height = 80;

  _showFloating() {
    var overlayState = Overlay.of(context);

    OverlayEntry overlayEntry;

    overlayEntry = new OverlayEntry(builder: (context) {
      return Stack(
        children: [
          new Positioned(
            left: offset.dx,
            top: offset.dy,
            child: _buildFlating(overlayEntry),
          )
        ],
      );
    });

    overlayState.insert(overlayEntry);
  }

  _buildFlating(OverlayEntry overlayEntry) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanDown: (details) {
        offset = details.globalPosition - Offset(height / 2, height / 2);
        overlayEntry.markNeedsBuild();
      },
      onPanUpdate: (DragUpdateDetails details) {
        offset = offset + details.delta;
        overlayEntry.markNeedsBuild();
      },
      onLongPress: () {
        overlayEntry.remove();
      },
      child: new Material(
        color: Colors.transparent,
        child: Container(
          height: height,
          width: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(height / 2)),
          ),
          child: new Text(
            "Long Press remove",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("LawliteFloatingTouchDemoPage"),
      ),
      body: new Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              _showFloating();
            },
            child: new Text("显示悬浮"),
          ),
        ),
      ),
    );
  }
}
