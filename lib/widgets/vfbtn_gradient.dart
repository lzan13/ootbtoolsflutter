import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

/// 渐变按钮组件
class VFBtnGradient extends StatelessWidget {
  // 标题
  final String title;
  // 背景色
  final Color? startColor;
  final Color? endColor;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtnGradient({
    Key? key,
    this.title = "",
    this.startColor,
    this.endColor,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: VFColors.transparent,
        foregroundColor: startColor!.computeLuminance() > 0.5
            ? VFColors.black
            : VFColors.white,
        elevation: VFDimens.elevationLow,
        padding: const EdgeInsets.all(VFDimens.d0),
        minimumSize: Size(width, height),
        shadowColor: startColor!.withAlpha(128),
      ),
      onPressed: isEnable ? onPressed : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              startColor!,
              endColor!,
            ],
          ),
          borderRadius: BorderRadius.circular(VFDimens.roundRadiusNormal),
        ),
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }
}
