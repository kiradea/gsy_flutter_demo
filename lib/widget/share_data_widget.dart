import 'package:flutter/material.dart';

class ShareDataWiget extends InheritedWidget {
  final int data;
  ShareDataWiget({
    @required this.data,
    Widget child,
  }) : super(child: child);

  static ShareDataWiget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWiget>();
  }

  @override
  bool updateShouldNotify(ShareDataWiget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}
