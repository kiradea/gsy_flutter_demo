import 'package:flutter/material.dart';

/// 圆角效果处理实现
class OverflowImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("OverflowImagePage"),
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          ///第二个Item
          if (index == 1) {
            return new Container(
              color: Colors.black,
              height: 100,
            );
          } else if (index == 2) {
            return Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height,
            );
          }

          ///广告图 Item
          return new Container(
            height: 100,
            child: OverflowBox(
                alignment: Alignment.center,
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 220 / 247,
                  image: AssetImage("static/gsy_cat.png"),
                  fit: BoxFit.fill,
                ),
                maxHeight: MediaQuery.of(context).size.height),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
