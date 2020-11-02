import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/anima_demo_page2.dart';
import 'dart:math';
import 'dart:ui';

class NewAnimaDemoPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewAnimaDemoPageState2();
  }
}

class _NewAnimaDemoPageState2 extends State<NewAnimaDemoPage2>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInSine,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("NewAnimaDemoPage2"),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: CRAnimation(
            minR: 0,
            maxR: 250,
            offset: Offset(MediaQuery.of(context).size.width / 2,
                MediaQuery.of(context).size.height / 2),
            child: Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 300,
                width: 300,
                color: Colors.redAccent,
                child: Text("TEST ON LINE"),
              ),
            ),
            animation: animation),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.status == AnimationStatus.completed ||
              controller.status == AnimationStatus.forward) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: Text("Click"),
      ),
    );
  }
}

class NewCRAnimation extends StatelessWidget {
  final Offset offset;
  final double minR;
  final double maxR;
  final Widget child;
  final Animation<double> animation;

  NewCRAnimation(
      {@required this.child,
      @required this.animation,
      this.offset,
      this.minR,
      this.maxR});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: animation,
        builder: (_, __) {
          return ClipPath(
            clipper: NewAnimationClipper(
                maxR: maxR, value: animation.value, minR: minR, offset: offset),
            child: this.child,
          );
        });
  }
}

class NewAnimationClipper extends CustomClipper<Path> {
  final double value;

  final double minR;

  final double maxR;

  final Offset offset;

  NewAnimationClipper({this.value, this.offset, this.minR, this.maxR});

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    var offset = this.offset ?? Offset(size.width / 2, size.height / 2);

    var maxRadius = minR ?? radiusSize(size, offset);

    var minRadius = maxR ?? 0;

    var radius = lerpDouble(minRadius, maxRadius, value);

    var react = Rect.fromCircle(radius: radius, center: offset);

    path.addOval(react);
    return path;
  }

  radiusSize(Size size, Offset offset) {
    final height = max(offset.dy, size.height - offset.dy);
    final width = max(offset.dx, size.width - offset.dx);
    return sqrt(width * width + height * height);
  }
}
