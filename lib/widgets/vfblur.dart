import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

enum VFBlurType {
  circle,
  rect,
}

///
/// 自定义模糊控件
///
class VFBlur extends StatelessWidget {
  // 子控件
  final Widget child;
  // 模糊类型
  final VFBlurType type;
  // 半径
  final double radius;
  // 模糊半径
  final double blurRadius;

  const VFBlur({
    super.key,
    required this.child,
    this.type = VFBlurType.rect,
    this.radius = VFDimens.d6,
    this.blurRadius = VFDimens.d6,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case VFBlurType.circle:
        return ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurRadius,
              sigmaY: blurRadius,
            ),
            child: Container(
              color: VFColors.white.withOpacity(0.1),
              child: child,
            ),
          ),
        );
      case VFBlurType.rect:
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurRadius,
              sigmaY: blurRadius,
            ),
            child: Container(
              color: VFColors.white.withOpacity(0.1),
              child: child,
            ),
          ),
        );
    }
  }
}
