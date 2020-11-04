import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/rich/real_rich_text.dart';

class NewRichTextDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewRichTextDemoPageState();
  }
}

class _NewRichTextDemoPageState extends State<NewRichTextDemoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewRichTextDemoPage"),
      ),
      body: new Container(
        margin: EdgeInsets.all(10),
        child: Builder(
          builder: (context) {
            return Center(
              child: RealRichText([
                TextSpan(
                    text: "A Text Link",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        show(context, "kskdkkk");
                      }),
                ImageSpan(AssetImage("static/gsy_cat.png"),
                    imageWidth: 24, imageHeight: 24),
                ImageSpan(
                  AssetImage("static/gsy_cat.png"),
                  imageWidth: 24,
                  imageHeight: 24,
                ),
                TextSpan(
                    text: "hahaha",
                    style: TextStyle(color: Colors.yellow, fontSize: 14)),
                TextSpan(
                    text: "@Somebo",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "#RealRichText#",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ]),
            );
          },
        ),
      ),
    );
  }

  show(context, text) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: "HH",
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('色即是空打开了SDK浪费'),
          ));
        },
      ),
    ));
  }
}
