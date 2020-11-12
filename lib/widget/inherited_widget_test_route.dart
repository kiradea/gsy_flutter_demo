import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/share_data_widget.dart';
import 'package:gsy_flutter_demo/widget/test_widget.dart';

class InheritedWigetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InheritedWidgetTestRouteState();
  }
}

class _InheritedWidgetTestRouteState extends State<InheritedWigetTestRoute> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Center(
        child: ShareDataWiget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWiget(),
              ),
              RaisedButton(
                child: Text("add"),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
