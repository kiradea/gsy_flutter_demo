import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/viewpager_demo_page.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class NewViewPagerDemoPage extends StatelessWidget {
  final List<Color> colorList = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: new Text("NewViewPagerDemoPage"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            new Expanded(
              child: new TransformerPageView(
                loop: true,
                itemBuilder: (context, index) {
                  return new Container(
                    decoration: BoxDecoration(
                      color: colorList[index % colorList.length],
                      border: Border.all(color: Colors.white),
                    ),
                    child: new Center(
                      child: new Text(
                        "$index",
                        style: TextStyle(fontSize: 80.0, color: Colors.white),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
            new Expanded(
              child: new TransformerPageView(
                loop: true,
                transformer: new AccordionTransformer(),
                itemBuilder: (context, index) {
                  return new Container(
                      decoration: BoxDecoration(
                          color: colorList[index % colorList.length],
                          border: Border.all(color: Colors.white)),
                      child: new Center(
                        child: new Text(
                          "$index",
                          style: TextStyle(fontSize: 80.0, color: Colors.white),
                        ),
                      ));
                },
                itemCount: 3,
              ),
            ),
            new Expanded(
              child: new TransformerPageView(
                loop: true,
                transformer: new ThreeDTransformer(),
                itemBuilder: (context, index) {
                  return new Container(
                    decoration: BoxDecoration(
                        color: colorList[index % colorList.length],
                        border: Border.all(color: Colors.white)),
                    child: new Center(
                      child: new Text(
                        "$index",
                        style: TextStyle(color: Colors.white, fontSize: 80.0),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
            new Expanded(
              child: new TransformerPageView(
                loop: true,
                transformer: new DeepthPageTransformer(),
                itemBuilder: (context, index) {
                  return new Container(
                    decoration: BoxDecoration(
                        color: colorList[index % colorList.length],
                        border: Border.all(color: Colors.white)),
                    child: new Center(
                      child: new Text(
                        "$index",
                        style: TextStyle(fontSize: 80.0, color: Colors.white),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThreeDTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    // TODO: implement transform
    double position = info.position;
    double height = info.height;
    double width = info.width;
    double pivotX = 0.0;

    if (position < 0 && position >= -1) {
      pivotX = width;
    }

    return new Transform(
      transform: new Matrix4.identity()
        ..rotate(new vector.Vector3(0.0, 2.0, 0.0), position * 1.5),
      origin: new Offset(pivotX, height / 2),
      child: child,
    );
  }
}

class ZoomInPageTransformer extends PageTransformer {
  static const double ZOOM_MAX = 0.5;

  @override
  Widget transform(Widget child, TransformInfo info) {
    // TODO: implement transform
    double position = info.position;
    double width = info.width;

    if (position > 0 && position <= 1) {
      return new Transform.translate(
        offset: new Offset(-width * position, 0.0),
        child: new Transform.scale(
          scale: 1 - position,
          child: child,
        ),
      );
    }
    return child;
  }
}
