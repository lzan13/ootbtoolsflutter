import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

/// 圆形边框按钮
class VFBtnRoundBorder extends StatelessWidget {
  // 标题
  final String title;
  // 背景色
  final Color color;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtnRoundBorder({
    Key? key,
    this.title = "",
    this.color = VFColors.black,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        minimumSize: Size(width, height),
        side: BorderSide(color: color),
      ),
      onPressed: isEnable ? onPressed : null,
      child: Text(title),
    );
  }
}
