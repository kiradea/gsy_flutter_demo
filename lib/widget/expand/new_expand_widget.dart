import 'package:flutter/material.dart';
import 'package:gsy_flutter_demo/widget/expand/expand_widget.dart';
import 'package:gsy_flutter_demo/widget/stick/stick_demo_page2.dart';

class NewExpandableNotifier extends StatefulWidget {
  final ExpandableController expandableController;
  final bool initialExpanded;
  final Duration animationDuration;
  final Widget child;

  NewExpandableNotifier(
      {Key key,
      this.expandableController,
      this.initialExpanded,
      this.animationDuration,
      @required this.child})
      : assert(!(expandableController != null && animationDuration != null)),
        assert(!(expandableController != null && initialExpanded != null)),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return;
  }
}

class _NewExpandableNotifierState extends State<NewExpandableNotifier> {
  ExpandableController expandableController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.expandableController == null) {
      expandableController = ExpandableController(
          initialExpanded: widget.initialExpanded ?? false,
          animationDuration: widget.animationDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}

class _NewExpandableInheritedNotifier
    extends InheritedNotifier<ExpandableController> {
  _NewExpandableInheritedNotifier(
      {@required ExpandableController controller, @required Widget child})
      : super(notifier: controller, child: child);
}
