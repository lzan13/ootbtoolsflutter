import 'package:flutter/widgets.dart';

import 'package:vftools/vftools.dart';

class VFLRotatingSquare extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  const VFLRotatingSquare({
    super.key,
    this.color = VFColors.red,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  });

  @override
  VFLRotatingSquareState createState() => VFLRotatingSquareState();
}

class VFLRotatingSquareState extends State<VFLRotatingSquare> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1, _animation2;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat();
    _animation1 = Tween(begin: 0.0, end: 180.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeIn)));
    _animation2 = Tween(begin: 0.0, end: 180.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0, curve: Curves.easeOut)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateX((0 - _animation1.value) * 0.0174533)
        ..rotateY((0 - _animation2.value) * 0.0174533),
      alignment: FractionalOffset.center,
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: _itemBuilder(0),
      ),
    );
  }

  Widget _itemBuilder(int index) =>
      widget.itemBuilder != null ? widget.itemBuilder!(context, index) : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
