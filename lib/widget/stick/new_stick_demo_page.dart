import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/stick/stick_widget.dart';

class NewStickDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewStickDemoPageState();
  }
}

class _NewStickDemoPageState extends State<NewStickDemoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewStickDemoPage"),
      ),
      body: Container(
        child: new ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 100,
          itemBuilder: (context, index) {
            return new Container(
              height: 200,
              color: Colors.deepOrange,
              child: new StickWidget(
                stickHeader: new Container(
                  height: 50.0,
                  color: Colors.deepPurple,
                  padding: new EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      print("header");
                    },
                    child: new Text(
                      '我的 $index header',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                stickContent: new InkWell(
                  onTap: () {
                    print("content");
                  },
                  child: new Container(
                    margin: EdgeInsets.only(left: 10),
                    color: Colors.pinkAccent,
                    height: 150,
                    child: new Center(
                      child: new Text(
                        'My $index content',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
