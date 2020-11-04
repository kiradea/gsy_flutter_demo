import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/new_text_line_height_demo_page.dart';

class NewTextSizeDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewTextSizeDemoPageState();
  }
}

class _NewTextSizeDemoPageState extends State<NewTextSizeDemoPage> {
  double textScaleFactor = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .copyWith(textScaleFactor: textScaleFactor),
      child: Scaffold(
        appBar: AppBar(
          title: new Text("LawliteTextSizeDemoPage"),
        ),
        body: new Stack(
          children: [
            Container(
              color: Colors.blueGrey,
              margin: EdgeInsets.all(20),
              child: new Text(
                textContent,
                style: TextStyle(color: Colors.black),
              ),
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new FlatButton(
                      onPressed: () {
                        if (textScaleFactor > 1) {
                          setState(() {
                            textScaleFactor--;
                          });
                        }
                      },
                      color: Colors.redAccent,
                      child: new Text("-"),
                    ),
                    new SizedBox(
                      width: 10,
                    ),
                    new FlatButton(
                      onPressed: () {
                        setState(() {
                          textScaleFactor++;
                        });
                      },
                      color: Colors.greenAccent,
                      child: Text("+"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
