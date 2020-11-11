import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/cloud/cloud_demo_page.dart';
import 'package:gsy_flutter_demo/widget/cloud/cloud_widget.dart';

class NewCloudDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewCloudDemoPageState();
  }
}

class _NewCloudDemoPageState extends State<NewCloudDemoPage> {
  List<CloudItemData> dataList = const <CloudItemData>[
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
    CloudItemData('CloudGSY11111', Colors.amberAccent, 10, false),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewCloudDemoPage"),
      ),
      body: new Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: new FittedBox(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              color: Colors.brown,
              child: CloudWidget(
                ratio: 1,
                children: [
                  for (var item in dataList)
                    RotatedBox(
                      quarterTurns: item.rotate ? 1 : 0,
                      child: Text(
                        item.text,
                        style: new TextStyle(
                            fontSize: item.size, color: item.color),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
