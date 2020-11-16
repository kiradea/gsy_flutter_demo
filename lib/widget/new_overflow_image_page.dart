import 'package:flutter/material.dart';

class NewOverflowImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewOverflowImagePage"),
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 1) {
            return Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height,
            );
          }

          return new Container(
            height: 100,
            child: OverflowBox(
              alignment: Alignment.center,
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 200,
                image: AssetImage("static/gsy_cat.png"),
                fit: BoxFit.fill,
              ),
              maxHeight: MediaQuery.of(context).size.height,
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
