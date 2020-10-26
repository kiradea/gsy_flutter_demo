import 'package:flutter/material.dart';

class NewControllerDemoPage extends StatelessWidget {
  final TextEditingController controller =
      new TextEditingController(text: "Init Text");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("ceshi"),
      ),
      body: new Container(
        margin: EdgeInsets.all(10),
        child: new Center(
          child: new TextField(
            controller: controller,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("current Text ${controller.text}");
          controller.text = "Changed By FloatingActionButton";
        },
        child: new Text("C"),
      ),
    );
  }
}
