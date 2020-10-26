import 'package:flutter/material.dart';

import 'anim_progress_img_demo_page.dart';

class NewClipDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewClipDemoPage"),
      ),
      body: new Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("BoxDecroration 圆角"),
            new Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("static/gsy_cat.png")),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            new SizedBox(
              height: 40,
            ),
            new Text("BoxDecoration 圆角对 child"),
            new Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: new Image.asset(
                "static/gsy_cat.png",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            new SizedBox(
              height: 50,
            ),
            new Text("ClipReact 圆角对 child"),
            new ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: new Image.asset(
                "static/gsy_cat.png",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
