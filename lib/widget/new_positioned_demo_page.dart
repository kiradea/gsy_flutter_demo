import 'package:flutter/material.dart';

class NewPositionedDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewPositionedDemoPage"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(15),
        child: new Stack(
          children: [
            new MaterialButton(
              onPressed: () {},
              color: Colors.blue,
            ),
            new Positioned(
              child: new MaterialButton(
                onPressed: () {},
                color: Colors.greenAccent,
              ),
              left: MediaQuery.of(context).size.width / 2,
            ),
            new Positioned(
              child: new MaterialButton(
                onPressed: () {},
                color: Colors.yellow,
              ),
              left: MediaQuery.of(context).size.width / 5,
              top: MediaQuery.of(context).size.height / 4 * 3,
            ),
            new Positioned(
              child: new MaterialButton(
                onPressed: () {},
                color: Colors.redAccent,
              ),
              left: MediaQuery.of(context).size.width / 2 -
                  Theme.of(context).buttonTheme.minWidth / 2,
              top: MediaQuery.of(context).size.height / 2 -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,
            )
          ],
        ),
      ),
    );
  }
}
