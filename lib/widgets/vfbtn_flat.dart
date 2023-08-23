import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

/// 圆形按钮
class VFBtnFlat extends StatelessWidget {
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

  const VFBtnFlat({
    Key? key,
    this.title = "",
    this.color = VFColors.grey87,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor:
            color.computeLuminance() > 0.5 ? VFColors.black : VFColors.white,
        elevation: VFDimens.elevationNo,
        minimumSize: Size(width, height),
      ),
      onPressed: isEnable ? onPressed : null,
      child: Text(title),
    );
  }
}
