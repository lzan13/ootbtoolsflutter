import 'package:flutter/widgets.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_tween.dart';

class OTLThreeBounce extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  const OTLThreeBounce({
    super.key,
    this.color = OTColors.red,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  });

  @override
  OTLThreeBounceState createState() => OTLThreeBounceState();
}

class OTLThreeBounceState extends State<OTLThreeBounce> with SingleTickerProviderStateMixin {
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
      size: Size(widget.size * 2, widget.size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (i) {
          return ScaleTransition(
            scale: OTTween(begin: 0.0, end: 1.0, delay: i * .2).animate(_controller),
            child: SizedBox.fromSize(size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(int index) =>
      widget.itemBuilder != null ? widget.itemBuilder!(context, index) : DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle));
}
