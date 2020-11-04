import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class NewViewPagerDemoPage extends StatelessWidget {
  final List<Color> colorList = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: new Text("NewViewPagerDemoPage"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            new Expanded(
              child: new TransformerPageView(
                loop: true,
                itemBuilder: (context, index) {
                  return new Container(
                    decoration: BoxDecoration(
                      color: colorList[index % colorList.length],
                      border: Border.all(color: Colors.white),
                    ),
                    child: new Center(
                      child: new Text(
                        "$index",
                        style: TextStyle(fontSize: 80.0, color: Colors.white),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
