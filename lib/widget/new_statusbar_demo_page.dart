import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsy_flutter_demo/widget/statusbar_demo_page.dart';

class NewStatusBarDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewStatusBarDemoPageState();
  }
}

class _NewStatusBarDemoPageState extends State<NewStatusBarDemoPage> {
  bool customSystemUIOverlayStyle = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var body = getBody();
    if (customSystemUIOverlayStyle) {
      return body;
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: body,
    );
  }

  getBody() {
    return Scaffold(
      appBar: ImageAppBar(),
      body: new Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new FlatButton(
                onPressed: () {
                  setState(() {
                    customSystemUIOverlayStyle = true;
                  });
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light);
                },
                child: new Text("Light"),
                color: Colors.yellowAccent,
              ),
              new FlatButton(
                onPressed: () {
                  setState(() {
                    customSystemUIOverlayStyle = true;
                  });
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.dark);
                },
                child: new Text("Dark"),
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
