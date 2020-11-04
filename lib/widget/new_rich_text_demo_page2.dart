import 'package:flutter/material.dart';

class NewRichTextDemoPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewRichTextDemoPageState2();
  }
}

class _NewRichTextDemoPageState2 extends State<NewRichTextDemoPage2> {
  double size = 50;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewRichTextDemoPage2"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              setState(() {
                size += 10;
              });
            },
          ),
          IconButton(
            onPressed: () {
              setState(() {
                size -= 10;
              });
            },
            icon: Icon(Icons.remove_circle_outline),
          ),
        ],
      ),
      body: new Container(
        margin: EdgeInsets.all(10),
        child: Builder(
          builder: (context) {
            return Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "Flutter is"),
                WidgetSpan(
                    child: SizedBox(
                  width: 120,
                  height: 50,
                  child: Card(
                    color: Colors.blue,
                    child: Center(
                      child: Text("Hello World"),
                    ),
                  ),
                )),
                WidgetSpan(
                    child: SizedBox(
                  width: size > 0 ? size : 0,
                  height: size > 0 ? size : 0,
                  child: new Image.asset(
                    "static/gsy_cat.png",
                    fit: BoxFit.cover,
                  ),
                )),
                TextSpan(text: "the best!")
              ])),
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
        label: "xx",
        onPressed: () {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("you pressed")));
        },
      ),
    ));
  }
}
