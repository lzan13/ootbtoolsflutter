import 'package:flutter/widgets.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

class OTLCubeGrid extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  const OTLCubeGrid({
    super.key,
    this.color = OTColors.red,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  });

  @override
  OTLCubeGridState createState() => OTLCubeGridState();
}

class OTLCubeGridState extends State<OTLCubeGrid> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _anim1, _anim2, _anim3, _anim4, _anim5;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat(reverse: true);
    _anim1 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.1, 0.6, curve: Curves.easeIn)));
    _anim2 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.7, curve: Curves.easeIn)));
    _anim3 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.8, curve: Curves.easeIn)));
    _anim4 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.9, curve: Curves.easeIn)));
    _anim5 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0, curve: Curves.easeIn)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(widget.size),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim3, 0),
              _square(_anim4, 1),
              _square(_anim5, 2),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim2, 3),
              _square(_anim3, 4),
              _square(_anim4, 5),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim1, 6),
              _square(_anim2, 7),
              _square(_anim3, 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _square(Animation<double> animation, int index) {
    return ScaleTransition(
      scale: animation,
      child: SizedBox.fromSize(size: Size.square(widget.size / 3), child: _itemBuilder(index)),
    );
  }

  Widget _itemBuilder(int index) =>
      widget.itemBuilder != null ? widget.itemBuilder!(context, index) : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
