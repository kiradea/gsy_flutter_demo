import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/link_sliver/link_flexible_space_bar.dart';
import 'package:gsy_flutter_demo/widget/link_sliver/link_sliver_header.dart';

class NewLinkSliverDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewLinkSliverDemoPageState();
  }
}

class _NewLinkSliverDemoPageState extends State<NewLinkSliverDemoPage> {
  renderBottomItem() {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Center(
          child: Text(
            "FFF",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                leading: Container(),
                expandedHeight: 260,
                flexibleSpace: LinkFlexibleSpaceBar(
                  centerTitle: false,
                  title: Container(
                    margin: EdgeInsets.only(left: 20, top: 30, bottom: 20),
                    child: Text("GSY"),
                  ),
                  image: "static/gsy_cat.png",
                  bottom: List.generate(4, (index) {
                    return renderBottomItem();
                  }),
                  titlePadding: EdgeInsets.all(0),
                ),
                pinned: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.settings_overscan),
                    tooltip: "Add New Entry",
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    tooltip: "add sdsd",
                    onPressed: () {},
                  )
                ],
              )
            ];
          },
          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                LinkSliverHeader(
                  initLayoutExtent: 60,
                  containerExtent: 120,
                  triggerPullDistance: 120,
                  pinned: false,
                ),
                SliverSafeArea(
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Card(
                        child: new Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          child: Text("Item $index"),
                        ),
                      );
                    }, childCount: 100),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
