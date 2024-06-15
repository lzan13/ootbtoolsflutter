import 'package:flutter/widgets.dart';
import 'package:vftools/themes/vfthemes.dart';
import 'package:vftools/widgets/loading/vftween.dart';

enum VFLWaveType { start, end, center }

class VFLWave extends StatefulWidget {
  final Color color;
  final double size;
  final VFLWaveType type;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  const VFLWave(
      {super.key,
      this.color = VFColors.red,
      this.type = VFLWaveType.start,
      this.size = 50.0,
      this.itemBuilder,
      this.duration = const Duration(milliseconds: 1200),
      this.controller});

  @override
  VFLWaveState createState() => VFLWaveState();
}

class VFLWaveState extends State<VFLWave> with SingleTickerProviderStateMixin {
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
    final List<double> _bars = getAnimationDelay();
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 1.25, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_bars.length, (i) {
            return ScaleYWidget(
              scaleY: VFTween(begin: .4, end: 1.0, delay: _bars[i]).animate(_controller),
              child: SizedBox.fromSize(size: Size(widget.size * 0.2, widget.size), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  List<double> getAnimationDelay() {
    switch (widget.type) {
      case VFLWaveType.start:
        return [-1.2, -1.1, -1.0, -.9, -.8];
      case VFLWaveType.end:
        return [-.8, -.9, -1.0, -1.1, -1.2];
      case VFLWaveType.center:
      default:
        return [-0.75, -0.95, -1.2, -0.95, -0.75];
    }
  }

  Widget _itemBuilder(int index) =>
      widget.itemBuilder != null ? widget.itemBuilder!(context, index) : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}

class ScaleYWidget extends AnimatedWidget {
  final Widget child;
  final Alignment alignment;

  // Animation<double> get scale => listenable;

  const ScaleYWidget({
    super.key,
    required Animation<double> scaleY,
    required this.child,
    this.alignment = Alignment.center,
  }) : super(listenable: scaleY);

  @override
  Widget build(BuildContext context) {
    return Transform(transform: Matrix4.identity()..scale(1.0, 1.0, 1.0), alignment: alignment, child: child);
  }
}
