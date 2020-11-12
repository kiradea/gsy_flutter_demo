import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/share_data_widget.dart';

class TestWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<TestWiget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWiget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Dependencies change");
  }
}
