import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/stick_sliver_list_demo_page.dart';

final random = math.Random();
final stickHeader = 50.0;

class NewStickExpendDemoPage extends StatefulWidget {

  final List<NewExpandedModel> tagList = List.generate(50, (index) => {
    return NewExpandedModel(false,List(random.nextInt(20)));
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
        child: new ListView.builder(itemBuilder: null),
      ),
    );
  }
}

class NewExpandedModel {
  bool expended;
  List dataList;

  NewExpandedModel(this.expended, this.dataList);
}
