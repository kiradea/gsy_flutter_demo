import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/verification_code_input_demo_page.dart';

class NewVerificationCodeInputDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewVerificationCodeInputDemoPage"),
      ),
      body: new GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          child: new Center(
            child: VerCodeInput(
              ctx: context,
              length: 6,
            ),
          ),
        ),
      ),
    );
  }
}
