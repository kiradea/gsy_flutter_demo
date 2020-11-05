import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/custom_multi_render_demo_page.dart';
import 'dart:math' as math;

class NewCustomMultiRenderDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewCustomMultiRenderDemoPageState();
  }
}

class _NewCustomMultiRenderDemoPageState
    extends State<NewCustomMultiRenderDemoPage> {
  List customLayoutId = ["0", "1", "2", "3", "4"].toList();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double childSize = 66;
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewCustomMultiRenderDemoPage"),
      ),
      body: new Center(
        child: new Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: CustomMultiChildLayout(
            children: [
              for (var item in customLayoutId)
                new LayoutId(id: item, child: ContentItem(item, childSize))
            ],
            delegate: NewCircleLayoutDelegate(
              customLayoutId,
              childSize: Size(childSize, childSize),
              center: Offset(MediaQuery.of(context).size.width / 2,
                  MediaQuery.of(context).size.width / 2),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        new FlatButton(
          color: Colors.amberAccent,
          onPressed: () {
            setState(() {
              customLayoutId.add("${customLayoutId.length}");
            });
          },
          child: new Text(
            "+",
          ),
        ),
        new FlatButton(
          color: Colors.indigoAccent,
          onPressed: () {
            setState(() {
              if (customLayoutId.length > 1) {
                customLayoutId.removeLast();
              }
            });
          },
          child: new Text("-"),
        )
      ],
    );
  }
}

class NewCircleLayoutDelegate extends MultiChildLayoutDelegate {
  final List<String> customLayoutId;

  final Offset center;

  Size childSize;

  NewCircleLayoutDelegate(this.customLayoutId,
      {this.center = Offset.zero, this.childSize});

  @override
  void performLayout(Size size) {
    // TODO: implement performLayout
    for (var item in customLayoutId) {
      if (hasChild(item)) {
        double r = 100;

        int index = int.parse(item);

        double step = 360 / customLayoutId.length;

        double hd = (2 * math.pi / 360) * step * index;

        var x = center.dx + math.sin(hd) * r;

        var y = center.dy - math.cos(hd) * r;

        childSize ??= Size(size.width / customLayoutId.length,
            size.height / customLayoutId.length);

        layoutChild(item, BoxConstraints.loose(childSize));

        final double centerX = childSize.width / 2.0;

        final double centerY = childSize.height / 2.0;

        var result = new Offset(x - centerX, y - centerY);

        positionChild(item, result);
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return false;
  }
}
