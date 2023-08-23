import 'package:flutter/widgets.dart';
import 'package:vftools/themes/vfthemes.dart';

class VFLDoubleBounce extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  const VFLDoubleBounce({
    Key? key,
    this.color = VFColors.red87,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  }) : super(key: key);

  @override
  _VFLDoubleBounceState createState() => _VFLDoubleBounceState();
}

class _VFLDoubleBounceState extends State<VFLDoubleBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _animation = Tween(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Transform.scale(
            scale: (_animation.value.abs() - 1).abs(),
            child: SizedBox.fromSize(
                size: Size.square(widget.size), child: _itemBuilder(0)),
          ),
          Transform.scale(
            scale: (_animation.value).abs(),
            child: SizedBox.fromSize(
                size: Size.square(widget.size), child: _itemBuilder(1)),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: widget.color.withOpacity(0.6)));
}
