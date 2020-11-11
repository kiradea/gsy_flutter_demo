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
}
