import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/honor_demo_page.dart';

class NewHonorDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewHonorDemoPage"),
      ),
      body: Container(
        child: Center(
          child: new InkWell(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) {
                    return NewHonorPage();
                  },
                  fullscreenDialog: true));
            },
            child: new Hero(
              tag: "image",
              child: new Image.asset(
                "static/gsy_cat.png",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewHonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: new InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: new Container(
          alignment: Alignment.center,
          child: new Hero(
              tag: "image",
              child: new Image.asset(
                "static/gsy_cat.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              )),
        ),
      ),
    );
  }
}
