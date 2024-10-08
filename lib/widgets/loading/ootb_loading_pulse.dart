import 'package:flutter/widgets.dart';

class OTLPulse extends StatefulWidget {
  const OTLPulse({
    super.key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(seconds: 1),
    this.controller,
  }) : assert(
          !(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
          'You should specify either a itemBuilder or a color',
        );

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<OTLPulse> createState() => _OTLPulseState();
}

class _OTLPulseState extends State<OTLPulse> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..repeat();
    _animation = CurveTween(curve: Curves.easeInOut).animate(_controller);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1.0 - _animation.value,
      child: Transform.scale(
        scale: _animation.value,
        child: SizedBox.fromSize(
          size: Size.square(widget.size),
          child: _itemBuilder(0),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        );
}
