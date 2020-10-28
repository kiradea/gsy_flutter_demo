import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_pull/gsy_refresh_sliver.dart';
import 'custom_pull/gsy_refresh_sliver.dart';


class NewRefreshDemoPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return
  }
}

class _NewRefreshDemoPageState3 extends State<NewRefreshDemoPage3>{
  final GlobalKey<CupertinoSliverRefreshControlState> sliverRefreshKey = GlobalKey<CupertinoSliverRefreshControlState>();

  final int pageSize = 30;

  bool disposed = false;

  List<String> dataList = new List();

  final ScrollController _scrollController = new ScrollController();

  Future<void> onRefresh() async {
    await Future.delayed()
  }
}