import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newV) {
    setState(() {
      _active = newV;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  TapboxB({Key key, this.active, @required this.onChanged});

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

//混合状态管理

class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ParentWdigetCState();
  }
}

class _ParentWdigetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newV) {
    setState(() {
      _active = newV;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TapboxC(
      active: _active,
      onChanged: _handleTapboxChanged,
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;

  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TapboxCState();
  }
}

class _TapboxCState extends State<TapboxC> {
  bool _hightlight = false;

  void _hangdleTapDown(TapDownDetails tapDownDetails) {
    setState(() {
      _hightlight = true;
    });
  }

  void _handleTapUp(TapUpDetails tapUpDetails) {
    setState(() {
      _hightlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _hightlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTapDown: _hangdleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _hightlight
                ? Border.all(color: Colors.teal[700], width: 10.0)
                : null),
      ),
    );
  }
}
