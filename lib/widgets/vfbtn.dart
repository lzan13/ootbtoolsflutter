import 'package:flutter/material.dart';

import 'package:vftools/vftools.dart';

///
/// 按钮
///
class VFBtn extends StatelessWidget {
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

  const VFBtn({
    super.key,
    this.title = "",
    this.color = VFColors.grey,
    this.width = VFDimens.d64,
    this.height = VFDimens.d42,
    this.isEnable = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color.computeLuminance() > 0.5 ? VFColors.black87 : VFColors.white87,
        elevation: isEnable ? VFDimens.elevationLow : VFDimens.elevationNo,
        minimumSize: Size(width, height),
        shadowColor: color.withAlpha(128),
      ),
      onPressed: isEnable ? onPressed : null,
      child: Text(title),
    );
  }
}

///
/// 边框按钮
///
class VFBtnBorder extends StatelessWidget {
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

  const VFBtnBorder({
    super.key,
    this.title = "",
    this.color = VFColors.black,
    this.width = VFDimens.d64,
    this.height = VFDimens.d42,
    this.isEnable = true,
    this.onPressed,
  });

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

///
/// 渐变按钮组件
///
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
    super.key,
    this.title = "",
    this.startColor,
    this.endColor,
    this.width = VFDimens.d64,
    this.height = VFDimens.d42,
    this.isEnable = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: VFColors.transparent,
        foregroundColor: startColor!.computeLuminance() > 0.5 ? VFColors.black : VFColors.white,
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

///
/// 扁平按钮
///
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
    super.key,
    this.title = "",
    this.color = VFColors.grey,
    this.width = VFDimens.d64,
    this.height = VFDimens.d42,
    this.isEnable = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color.computeLuminance() > 0.5 ? VFColors.black : VFColors.white,
        elevation: VFDimens.elevationNo,
        minimumSize: Size(width, height),
      ),
      onPressed: isEnable ? onPressed : null,
      child: Text(title),
    );
  }
}

///
/// 扁平无边界按钮
///
class VFBtnFlatBorderless extends StatelessWidget {
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

  const VFBtnFlatBorderless({
    super.key,
    this.title = "",
    this.color = VFColors.black,
    this.width = VFDimens.d64,
    this.height = VFDimens.d42,
    this.isEnable = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: color,
        minimumSize: Size(width, height),
      ),
      onPressed: isEnable ? onPressed : null,
      child: Text(title),
    );
  }
}
