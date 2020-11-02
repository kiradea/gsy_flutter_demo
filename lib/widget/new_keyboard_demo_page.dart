import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/keyboard_demo_page.dart';

class NewKeyBoardDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewKeyBoardDemoPageState();
  }
}

class _NewKeyBoardDemoPageState extends State<NewKeyBoardDemoPage> {
  bool isKeyboardShowing = false;

  final FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return KeyboardDetector(
      keyboardShowCallback: (isKeyboardShowing) {
        setState(() {
          this.isKeyboardShowing = isKeyboardShowing;
        });
      },
      content: Scaffold(
        appBar: AppBar(
          title: new Text("NewKeyBoardDemoPage"),
        ),
        body: new GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Expanded(
                  child: new Container(
                    alignment: Alignment.center,
                    child: Text(
                      isKeyboardShowing ? "键盘弹起" : "键盘消失",
                      style: TextStyle(
                          color: isKeyboardShowing
                              ? Colors.redAccent
                              : Colors.greenAccent),
                    ),
                  ),
                  flex: 2,
                ),
                new Expanded(
                  child: new Center(
                    child: new FlatButton(
                      onPressed: () {
                        if (!isKeyboardShowing) {
                          FocusScope.of(context).requestFocus(_focusNode);
                        }
                      },
                      child: new Text("弹出键盘"),
                    ),
                  ),
                ),
                new Expanded(
                  flex: 2,
                  child: new Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: new TextField(
                      focusNode: _focusNode,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

typedef KeyboardShowCallback = void Function(bool isKeyboardShowing);

class NewKeyboardDetector extends StatefulWidget {
  final KeyboardShowCallback keyboardShowCallback;

  final Widget content;

  NewKeyboardDetector({this.keyboardShowCallback, @required this.content});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }
}

class _NewKeyboardDetectorState extends State<NewKeyboardDetector>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        widget.keyboardShowCallback
            ?.call(MediaQuery.of(context).viewInsets.bottom > 0);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.content;
  }
}
