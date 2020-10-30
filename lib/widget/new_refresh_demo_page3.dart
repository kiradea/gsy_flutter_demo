import 'dart:math';

import 'package:flutter/cupertino.dart' as IOS;
import 'package:flutter/material.dart';

import 'package:gsy_flutter_demo/widget/custom_pull/gsy_refresh_sliver.dart';

class NewRefreshDemoPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewRefreshDemoPageState3();
  }
}

class _NewRefreshDemoPageState3 extends State<NewRefreshDemoPage3> {
  final GlobalKey<CupertinoSliverRefreshControlState> sliverRefreshKey =
      GlobalKey<CupertinoSliverRefreshControlState>();

  final int pageSize = 30;

  bool disposed = false;

  List<String> dataList = new List();

  final ScrollController _scrollController = new ScrollController();

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    dataList.clear();
    for (int i = 0; i < pageSize; i++) {
      dataList.add("refresh");
    }
    if (disposed) {
      return;
    }
    setState(() {});
  }

  Future<void> loadMore() async {
    await Future.delayed(Duration(seconds: 2));
    for (int i = 0; i < pageSize; i++) {
      dataList.add("loadMore");
    }
    if (disposed) {
      return;
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    new Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.animateTo(-141,
          duration: Duration(milliseconds: 600), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewRefreshDemoPage3"),
      ),
      body: Container(
        child: new NotificationListener(
          onNotification: (ScrollNotification notification) {
            sliverRefreshKey.currentState
                .notifyScrollNotification(notification);
            if (notification is ScrollEndNotification) {
              if (_scrollController.position.pixels > 0 &&
                  _scrollController.position.pixels ==
                      _scrollController.position.maxScrollExtent) {
                loadMore();
              }
            }
            return false;
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: <Widget>[
              CupertinoSliverRefreshControl(
                key: sliverRefreshKey,
                refreshIndicatorExtent: 100,
                refreshTriggerPullDistance: 140,
                onRefresh: onRefresh,
                builder: buildSimpleRefreshIndicator,
              ),
              SliverSafeArea(
                sliver: SliverList(
                  ///代理显示
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index == dataList.length) {
                        return new Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return Card(
                        child: new Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          child: new Text("Item ${dataList[index]} $index"),
                        ),
                      );
                    },
                    childCount: (dataList.length >= pageSize)
                        ? dataList.length + 1
                        : dataList.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSimpleRefreshIndicator(
  BuildContext context,
  RefreshIndicatorMode refreshState,
  double pulledExtent,
  double refreshTriggerPullDistance,
  double refreshIndicatorExtent,
) {
  const Curve opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: refreshState != RefreshIndicatorMode.refresh
          ? Opacity(
              opacity: opacityCurve.transform(
                  min(pulledExtent / refreshTriggerPullDistance, 1.0)),
              child: const Icon(
                IOS.CupertinoIcons.down_arrow,
                color: IOS.CupertinoColors.inactiveGray,
                size: 36.0,
              ),
            )
          : Opacity(
              opacity: opacityCurve
                  .transform(min(pulledExtent / refreshIndicatorExtent, 1.0)),
              child: const IOS.CupertinoActivityIndicator(radius: 14.0),
            ),
    ),
  );
}
