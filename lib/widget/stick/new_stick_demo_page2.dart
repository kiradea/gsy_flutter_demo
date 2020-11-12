import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/stick/stick_widget.dart';
import 'package:gsy_flutter_demo/widget/stick_sliver_list_demo_page.dart';

final random = math.Random();
final stickHeader = 50.0;

class NewStickExpendDemoPage extends StatefulWidget {
  final List<NewExpandedModel> tagList = List.generate(50, (index) {
    return NewExpandedModel(false, List(random.nextInt(20)));
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewStickExpendDemoPageState();
  }
}

class _NewStickExpendDemoPageState extends State<NewStickExpendDemoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewStickExpendDemoPage"),
      ),
      body: Container(
        child: new ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: widget.tagList.length,
          itemBuilder: (context, index) {
            return new Container(
              color: Colors.white,
              child: new StickWidget(
                stickHeader: new Container(
                  height: stickHeader,
                  color: Colors.deepPurple,
                  padding: new EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  child: new InkWell(
                    onTap: () {
                      print("header");
                    },
                    child: new Text(
                      'My $index header',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                stickContent: Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewExpandChildList extends StatefulWidget {
  final NewExpandedModel expandedModel;

  NewExpandChildList(this.expandedModel);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewExpandChildListState();
  }
}

class _NewExpandChildListState extends State<NewExpandChildList> {
  final GlobalKey globalKey = GlobalKey();

  final int animMilliseconds = 300;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double itemHeight = 150;

    double height = itemHeight * 3.0;

    return Container();
  }
}

class NewExpandedModel {
  bool expended;
  List dataList;

  NewExpandedModel(this.expended, this.dataList);
}
