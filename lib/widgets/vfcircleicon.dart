import 'package:flutter/material.dart';
import 'package:vftools/constants/vfconstants.dart';

import 'package:vftools/constants/vfdimens.dart';

/// 圆形边框Icon
class VFCircleIcon extends StatelessWidget {
  /// 背景颜色
  final Color bgColor;

  /// 颜色
  final Color color;

  /// Icon
  final IconData icon;

  const VFCircleIcon({
    Key? key,
    this.color = Colors.white,
    this.bgColor = VFColors.grey,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(VFDimens.d_56)),
      ),
      child: Center(
        child: icon == null
            ? EmptyIcon()
            : Icon(
                icon,
                size: VFDimens.d_20,
                color: color,
              ),
      ),
    );
  }
}

/// 空图标
class EmptyIcon extends Icon {
  const EmptyIcon() : super(Icons.hourglass_empty);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
