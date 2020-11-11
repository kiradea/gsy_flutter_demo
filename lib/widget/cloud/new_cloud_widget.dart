import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/cloud/cloud_render.dart';

class NewCloudWidget extends MultiChildRenderObjectWidget {
  final Overflow overflow;

  final double ratio;

  NewCloudWidget({
    Key key,
    this.ratio = 1,
    this.overflow = Overflow.clip,
    List<Widget> children = const <Widget>[],
  }) : super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return RenderCloudWidget(ratio: ratio, overflow: overflow);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderObject renderObject) {
    renderObject
      ..ratio = ratio
      ..overflow = overflow;
  }
}
