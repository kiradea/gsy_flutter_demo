import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/anim_progress_img_demo_page.dart';
import 'package:gsy_flutter_demo/widget/tag_demo_page.dart';

class NewTagDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewTagDemoPage"),
      ),
      body: new Container(
        child: new Wrap(
          children: [
            new NewTagItem("Start1"),
            for (var item in tags) new TagItem(item),
            new TagItem("End")
          ],
        ),
      ),
    );
  }
}

class NewTagItem extends StatelessWidget {
  final String text;

  NewTagItem(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withAlpha(60),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: new Text(text),
    );
  }
}

const List<String> tags = ["AAAA", "BBBB"];
