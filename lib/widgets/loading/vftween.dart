import 'dart:math' as math show sin, pi;

import 'package:flutter/animation.dart';

///
/// 定义进度补间动画
///
class VFTween extends Tween<double> {
  VFTween({double begin, double end, this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
