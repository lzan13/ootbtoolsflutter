import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

enum OTBlurType {
  circle,
  rect,
}

///
/// 自定义模糊控件
///
class OTBlur extends StatelessWidget {
  // 子控件
  final Widget child;
  // 模糊类型
  final OTBlurType type;
  // 半径
  final double radius;
  // 模糊半径
  final double blurRadius;

  const OTBlur({
    super.key,
    required this.child,
    this.type = OTBlurType.rect,
    this.radius = OTDimens.d0,
    this.blurRadius = OTDimens.d6,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case OTBlurType.circle:
        return ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurRadius,
              sigmaY: blurRadius,
            ),
            child: Container(
              color: OTColors.white.withOpacity(0.1),
              child: child,
            ),
          ),
        );
      case OTBlurType.rect:
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurRadius,
              sigmaY: blurRadius,
            ),
            child: Container(
              color: OTColors.white.withOpacity(0.1),
              child: child,
            ),
          ),
        );
    }
  }
}
