import 'package:flutter/widgets.dart';

import 'package:ootbtoolsflutter/widgets/loading/ootb_tween.dart';

class OTLDancingSquare extends StatefulWidget {
  const OTLDancingSquare({
    Key? key,
    this.color,
    this.size = 60.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
          !(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
          'You should specify either a itemBuilder or a color',
        ),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<OTLDancingSquare> createState() => _OTLDancingSquareState();
}

class _OTLDancingSquareState extends State<OTLDancingSquare> with SingleTickerProviderStateMixin {
  static const _itemCount = 12;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
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
    return SizedBox.fromSize(
      size: Size.square(widget.size),
      child: Stack(
        children: List.generate(_itemCount, (index) {
          final position = widget.size * .5;
          final delay = index / _itemCount;
          return Stack(
            children: [
              Positioned.fill(
                left: position,
                top: position,
                child: Transform(
                  transform: Matrix4.rotationX(30.0 * index * 0.0174533),
                  child: Align(
                    alignment: Alignment.center,
                    child: ScaleTransition(
                      scale: OTTween(
                        begin: 0.0,
                        end: 1.0,
                        delay: delay,
                      ).animate(_controller),
                      child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(index),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                left: position,
                top: -1 * position,
                child: Transform(
                  transform: Matrix4.rotationY(30.0 * index * 0.0174533),
                  child: Align(
                    alignment: Alignment.center,
                    child: ScaleTransition(
                      scale: OTTween(
                        begin: 0.0,
                        end: 1.0,
                        delay: delay,
                      ).animate(_controller),
                      child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(index),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                left: -1 * position,
                top: position,
                child: Transform(
                  transform: Matrix4.rotationX(30.0 * index * 0.0174533),
                  child: Align(
                    alignment: Alignment.center,
                    child: ScaleTransition(
                      scale: OTTween(
                        begin: 0.0,
                        end: 1.0,
                        delay: delay,
                      ).animate(_controller),
                      child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(index),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                left: position,
                top: position,
                child: Transform(
                  transform: Matrix4.rotationY(30.0 * index * 0.0174533),
                  child: Align(
                    alignment: Alignment.center,
                    child: ScaleTransition(
                      scale: OTTween(
                        begin: 0.0,
                        end: 1.0,
                        delay: delay,
                      ).animate(_controller),
                      child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(index),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.rectangle,
          ),
        );
}
