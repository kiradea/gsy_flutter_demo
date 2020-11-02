import 'package:flutter/material.dart';

class NewAnimaDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewAnimaDemoPageState();
  }
}

class _NewAnimaDemoPageState extends State<NewAnimaDemoPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller1;
  Animation animation1;
  Animation animation2;

  @override
  void initState() {
    super.initState();
    controller1 =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));

    animation1 = Tween(begin: 0.0, end: 100.0).animate(controller1)
      ..addListener(() {
        setState(() {});
      });

    animation2 = Tween(begin: 0.0, end: 1.0).animate(controller1);

    controller1.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("NewAnimaDemoPage"),
      ),
      body: new RotationTransition(
        turns: animation2,
        child: new Container(
          child: new Center(
            child: new Container(
              height: 200,
              width: 200,
              color: Colors.greenAccent,
              child: CustomPaint(
                foregroundPainter: _NewAnimationPainter(animation1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NewAnimationPainter extends CustomPainter {
  Paint _paint = new Paint();

  Animation animation;
  _NewAnimationPainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    _paint
      ..color = Colors.redAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(100, 100), animation.value * 1.5, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
