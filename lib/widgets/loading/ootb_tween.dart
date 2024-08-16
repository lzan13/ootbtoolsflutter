import 'dart:math' as math show sin, pi;

import 'package:flutter/animation.dart';

///
/// 定义进度补间动画
///
class OTTween extends Tween<double> {
  final double delay;
  OTTween({double begin = 0, double end = 360, this.delay = 0}) : super(begin: begin, end: end);

  @override
  double lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
