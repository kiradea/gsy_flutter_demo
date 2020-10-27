import 'dart:math';

import 'package:flutter/material.dart';

class NewTransformDemoPage extends StatelessWidget {
  getHeader(context) {
    return Transform.translate(
      offset: Offset(0, -30),
      child: new Container(
        width: 72.0,
        height: 72.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Theme.of(context).cardColor, blurRadius: 4.0)
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("static/gsy_cat.png"),
            )),
      ),
    );
  }

  getTempHeader(context) {
    return Transform.rotate(
      angle: pi / 4,
      child: new Container(
        height: 40,
        width: 40,
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewTransformDemoPage"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: new Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 300,
              padding: EdgeInsets.all(10),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getHeader(context),
                  getTempHeader(context),
                  new Text(
                    "Flutter hwsjdkljslkdfjslkfjlkdsjflsjdkfldlsfjkls"
                    "skjdlkfjsldkfjskljflskdjflsjdfljsdlfjsldfjklsdf"
                    "fjslkdfjlskdjflksj sdjfklsjdflksjdlf jklsdjflsjdfkl",
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 3,
                    style: TextStyle(),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
