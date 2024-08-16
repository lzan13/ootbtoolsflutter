import 'package:flutter/widgets.dart';

import 'package:ootbtoolsflutter/widgets/loading/ootb_tween.dart';

enum OTLPianoWaveType { start, end, center }

class OTLPianoWave extends StatefulWidget {
  const OTLPianoWave({
    super.key,
    this.color,
    this.type = OTLPianoWaveType.start,
    this.size = 50.0,
    this.itemBuilder,
    this.itemCount = 5,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
          !(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
          'You should specify either a itemBuilder or a color',
        ),
        assert(itemCount >= 2, 'itemCount Cant be less then 2 ');

  final Color? color;
  final int itemCount;
  final double size;
  final OTLPianoWaveType type;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<OTLPianoWave> createState() => _OTLPianoWaveState();
}

class _OTLPianoWaveState extends State<OTLPianoWave> with SingleTickerProviderStateMixin {
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
    final List<double> bars = getAnimationDelay(widget.itemCount);
    return SizedBox.fromSize(
      size: Size(widget.size * 1.25, widget.size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(bars.length, (i) {
          return DottedScaleXWidget(
            scaleX: OTTween(
              begin: .4,
              end: 1.0,
              delay: bars[i],
            ).animate(_controller),
            child: SizedBox.fromSize(
              size: Size(widget.size / widget.itemCount, widget.size),
              child: _itemBuilder(i),
            ),
          );
        }),
      ),
    );
  }

  List<double> getAnimationDelay(int itemCount) {
    switch (widget.type) {
      case OTLPianoWaveType.start:
        return _startAnimationDelay(itemCount);
      case OTLPianoWaveType.end:
        return _endAnimationDelay(itemCount);
      case OTLPianoWaveType.center:
      default:
        return _centerAnimationDelay(itemCount);
    }
  }

  List<double> _startAnimationDelay(int count) {
    return <double>[
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 - (index * 0.1) - 0.1,
      ).reversed,
      if (count.isOdd) -1.0,
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 + (index * 0.1) + (count.isOdd ? 0.1 : 0.0),
      ),
    ];
  }

  List<double> _endAnimationDelay(int count) {
    return <double>[
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 + (index * 0.1) + 0.1,
      ).reversed,
      if (count.isOdd) -1.0,
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 - (index * 0.1) - (count.isOdd ? 0.1 : 0.0),
      ),
    ];
  }

  List<double> _centerAnimationDelay(int count) {
    return <double>[
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 + (index * 0.2) + 0.2,
      ).reversed,
      if (count.isOdd) -1.0,
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 + (index * 0.2) + 0.2,
      ),
    ];
  }

  Widget _itemBuilder(int index) =>
      widget.itemBuilder != null ? widget.itemBuilder!(context, index) : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}

class DottedScaleXWidget extends AnimatedWidget {
  const DottedScaleXWidget({
    Key? key,
    required Animation<double> scaleX,
    required this.child,
    this.alignment = Alignment.center,
  }) : super(key: key, listenable: scaleX);

  final Widget child;
  final Alignment alignment;

  Animation<double> get scale => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..scale(scale.value * 0.8, 1.0, 1.0),
      alignment: alignment,
      child: child,
    );
  }
}
