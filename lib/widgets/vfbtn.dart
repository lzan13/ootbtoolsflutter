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
  final Color disableColor;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 是否正在加载中
  final bool isLoading;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtn({
    super.key,
    this.title = "",
    this.color = VFColors.grey,
    this.disableColor = VFColors.grey,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnable && !isLoading ? color : disableColor,
        foregroundColor: color.computeLuminance() > 0.5 ? VFColors.black87 : VFColors.white87,
        elevation: isEnable ? VFDimens.elevationLow : VFDimens.elevationNo,
        minimumSize: Size(width, height),
        shadowColor: color.withAlpha(128),
      ),
      onPressed: isEnable ? onPressed : null,
      child: isLoading ? VFLoading(type: VFLoadingType.circle) : Text(title),
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
  final Color disableColor;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 是否正在加载中
  final bool isLoading;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtnBorder({
    super.key,
    this.title = "",
    this.color = VFColors.black,
    this.disableColor = VFColors.grey,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: isEnable && !isLoading ? color : disableColor,
        minimumSize: Size(width, height),
        side: BorderSide(
          color: isEnable && !isLoading ? color : disableColor,
        ),
      ),
      onPressed: isEnable ? onPressed : null,
      child: isLoading ? VFLoading(type: VFLoadingType.circle) : Text(title),
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
  final Color disableColor;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 是否正在加载中
  final bool isLoading;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtnGradient({
    super.key,
    this.title = "",
    this.startColor,
    this.endColor,
    this.disableColor = VFColors.grey,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: VFColors.transparent,
        foregroundColor: startColor!.computeLuminance() > 0.5 ? VFColors.black : VFColors.white,
        elevation: isEnable && !isLoading ? VFDimens.elevationLow : VFDimens.elevationNo,
        padding: const EdgeInsets.all(VFDimens.d0),
        minimumSize: Size(width, height),
        shadowColor: isEnable && !isLoading ? startColor!.withAlpha(128) : disableColor,
      ),
      onPressed: isEnable ? onPressed : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isEnable && !isLoading ? [startColor!, endColor!] : [disableColor, disableColor],
          ),
          borderRadius: BorderRadius.circular(VFDimens.roundRadiusNormal),
        ),
        alignment: Alignment.center,
        child: isLoading ? VFLoading(type: VFLoadingType.circle) : Text(title),
      ),
    );
  }
}

/// 扁平按钮
class VFBtnFlat extends StatelessWidget {
  // 标题
  final String title;
  // 背景色
  final Color color;
  final Color disableColor;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 是否正在加载中
  final bool isLoading;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtnFlat({
    super.key,
    this.title = "",
    this.color = VFColors.grey,
    this.disableColor = VFColors.grey,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnable && !isLoading ? color : disableColor,
        foregroundColor: color.computeLuminance() > 0.5 ? VFColors.black : VFColors.white,
        elevation: VFDimens.elevationNo,
        minimumSize: Size(width, height),
      ),
      onPressed: isEnable ? onPressed : null,
      child: isLoading ? VFLoading(type: VFLoadingType.circle) : Text(title),
    );
  }
}

/// 扁平无边界按钮
class VFBtnFlatBorderless extends StatelessWidget {
  // 标题
  final String title;
  // 背景色
  final Color color;
  final Color disableColor;
  // 宽高
  final double width;
  final double height;
  // 是否激活
  final bool isEnable;
  // 是否正在加载中
  final bool isLoading;
  // 点击回调
  final VoidCallback? onPressed;

  const VFBtnFlatBorderless({
    super.key,
    this.title = "",
    this.color = VFColors.black,
    this.disableColor = VFColors.grey,
    this.width = VFDimens.d64,
    this.height = VFDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: isEnable && !isLoading ? color : disableColor,
        minimumSize: Size(width, height),
      ),
      onPressed: isEnable ? onPressed : null,
      child: isLoading ? VFLoading(type: VFLoadingType.circle) : Text(title),
    );
  }
}
