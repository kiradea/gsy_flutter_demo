import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gsy_flutter_demo/widget/stick/stick_render.dart';

class NewStickRender extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, StickParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, StickParentData> {
  ScrollableState _scrollableState;

  NewStickRender({@required ScrollableState scrollableState}) {
    this._scrollableState = scrollableState;
  }

  set scrollable(ScrollableState scrollableState) {
    if (_scrollableState == scrollableState) {
      return;
    }

    final ScrollableState preScroll = _scrollableState;
    _scrollableState = scrollableState;

    if (attached) {
      preScroll.position?.removeListener(() {
        markNeedsLayout();
      });
      scrollableState.position?.addListener(() {
        markNeedsLayout();
      });
    }
    markNeedsLayout();
  }

  double getScrollAbleDy() {
    RenderObject renderObject = _scrollableState.context.findRenderObject();
    if (!renderObject.attached) {
      return 0;
    }
    try {
      return localToGlobal(Offset.zero, ancestor: renderObject).dy;
    } catch (e) {
      print(e);
    }
    return 0;
  }

  @override
  void attach(covariant PipelineOwner owner) {
    // TODO: implement attach
    _scrollableState.position?.addListener(() {
      markNeedsLayout();
    });
    super.attach(owner);
  }

  @override
  void detach() {
    // TODO: implement detach
    _scrollableState.position?.removeListener(() {
      markNeedsLayout();
    });
    super.detach();
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    // TODO: implement computeMinIntrinsicHeight
    return (lastChild.getMinIntrinsicHeight(width) +
        firstChild.getMinIntrinsicHeight(width));
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    // TODO: implement computeMaxIntrinsicHeight
    return (lastChild.getMaxIntrinsicHeight(width) +
        firstChild.getMaxIntrinsicHeight(width));
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) {
    // TODO: implement computeDistanceToActualBaseline
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    defaultPaint(context, offset);
  }

  @override
  void setupParentData(covariant RenderObject child) {
    // TODO: implement setupParentData
    super.setupParentData(child);
    if (child.parentData is! StickParentData) {
      child.parentData = new StickParentData();
    }
  }

  @override
  void performLayout() {
    // TODO: implement performLayout
    var header = lastChild;
    var content = firstChild;

    var loosenConstraints = constraints.loosen();
    content.layout(loosenConstraints, parentUsesSize: true);
    header.layout(loosenConstraints, parentUsesSize: true);

    var contentHeight = content.size.height;
    var headrHeight = header.size.height;

    var width = content.size.width;
    var height = headrHeight + contentHeight;
    size = new Size(width, height);

    (content.parentData as StickParentData).offset = new Offset(0, headrHeight);

    var headerOffset = height - headrHeight;

    var scrollAbleDy = getScrollAbleDy();

    var realHeaderOffset = math.min(-scrollAbleDy, headerOffset);
    (header.parentData as StickParentData).offset =
        new Offset(0, math.max(0, realHeaderOffset));
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    // TODO: implement hitTestChildren
    return defaultHitTestChildren(result, position: position);
  }
}
