import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

/// 圆形按钮
class VFBtnRound extends StatelessWidget {
  // 标题
  final String title;
  // 背景色
  final Color bgColor;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtnRound({
    Key? key,
    this.title = "",
    this.bgColor = VFColors.grey87,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor:
            bgColor.computeLuminance() > 0.5 ? VFColors.black : VFColors.white,
        elevation: VFDimens.elevationLow,
        minimumSize: Size(width, height),
        shadowColor: bgColor.withAlpha(128),
      ),
      onPressed: isEnable ? onPressed : null,
      child: Text(title),
    );
  }
}
