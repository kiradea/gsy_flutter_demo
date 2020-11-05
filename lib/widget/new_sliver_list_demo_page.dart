import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gsy_flutter_demo/widget/sliver_list_demo_page.dart';

class NewSliverListDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewSliverListDemoPageState();
  }
}

class _NewSliverListDemoPageState extends State<NewSliverListDemoPage>
    with SingleTickerProviderStateMixin {
  int listCount = 30;

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverPersistentHeader(
        delegate: GSYSliverHeaderDelegate(
            maxHeight: 180,
            minHeight: 180,
            vSync: this,
            snapConfig: FloatingHeaderSnapConfiguration(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 10)),
            child: new Container(
              color: Colors.redAccent,
            )),
      ),
      SliverPersistentHeader(
        pinned: true,
        delegate: GSYSliverHeaderDelegate(
          maxHeight: 60,
          minHeight: 60,
          vSync: this,
          snapConfig: FloatingHeaderSnapConfiguration(
              curve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 10)),
          builder: (context, shrinkOffset, overlapsContent) {
            var ls = 10 - shrinkOffset / 60 * 10;
            return SizedBox.expand(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 10, left: ls, right: ls, top: ls),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new Expanded(
                      child: new Container(
                        alignment: Alignment.center,
                        color: Colors.orangeAccent,
                        child: new FlatButton(
                          onPressed: () {
                            setState(() {
                              listCount = 30;
                            });
                          },
                          child: new Text("按键1"),
                        ),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        alignment: Alignment.center,
                        color: Colors.orangeAccent,
                        child: new FlatButton(
                          onPressed: () {
                            setState(() {
                              listCount = 4;
                            });
                          },
                          child: new Text("Button2"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("NewSliverListDemoPage"),
      ),
      body: new Container(
        child: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: _sliverBuilder,
          body: ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                child: new Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: new Text("Item $index"),
                ),
              );
            },
            itemCount: listCount,
          ),
        ),
      ),
    );
  }
}
