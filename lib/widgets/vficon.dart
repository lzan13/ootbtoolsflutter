import 'package:flutter/material.dart';

import 'package:vftools/themes/vfthemes.dart';

/// 圆形边框Icon
class VFIcon extends StatelessWidget {
  // Icon
  final IconData? data;
  // 颜色
  final Color? color;
  // 背景颜色
  final Color? bgColor;

  const VFIcon({
    Key? key,
    this.data,
    this.color = VFColors.grey,
    this.bgColor = VFColors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(VFDimens.d56)),
      ),
      child: Center(
        child: data == null
            ? const EmptyIcon()
            : Icon(
                data,
                size: VFDimens.d20,
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
