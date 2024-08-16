import 'package:flutter/widgets.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_tween.dart';

class OTLFadingCube extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  const OTLFadingCube({
    super.key,
    this.color = OTColors.red,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  });

  @override
  OTLFadingCubeState createState() => OTLFadingCubeState();
}

class OTLFadingCubeState extends State<OTLFadingCube> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
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
      child: Center(
        child: Transform.rotate(
          angle: -45.0 * 0.0174533,
          child: Stack(
            children: List.generate(4, (i) {
              final _size = widget.size * 0.5, _position = widget.size * .5;
              return Positioned.fill(
                top: _position,
                left: _position,
                child: Transform.scale(
                  scale: 1.1,
                  origin: Offset(-_size * .5, -_size * .5),
                  child: Transform(
                    transform: Matrix4.rotationZ(90.0 * i * 0.0174533),
                    child: Align(
                      alignment: Alignment.center,
                      child: FadeTransition(
                        opacity: OTTween(begin: 0.0, end: 1.0, delay: 0.3 * i).animate(_controller),
                        child: SizedBox.fromSize(size: Size.square(_size), child: _itemBuilder(i)),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) =>
      widget.itemBuilder != null ? widget.itemBuilder!(context, index) : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
