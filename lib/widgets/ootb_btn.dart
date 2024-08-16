import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

///
/// 按钮
///
class OTBtn extends StatelessWidget {
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

  const OTBtn({
    super.key,
    this.title = "",
    this.color = OTColors.grey,
    this.disableColor = OTColors.grey,
    this.width = OTDimens.d64,
    this.height = OTDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnable && !isLoading ? color : disableColor,
        foregroundColor: color.computeLuminance() > 0.5 ? OTColors.black87 : OTColors.white87,
        elevation: isEnable ? OTDimens.elevationLow : OTDimens.elevationNo,
        minimumSize: Size(width, height),
        shadowColor: color.withAlpha(128),
      ),
      onPressed: isEnable ? onPressed : null,
      child: isLoading ? OTLoading(type: OTLoadingType.circle) : Text(title),
    );
  }
}

///
/// 边框按钮
///
class OTBtnBorder extends StatelessWidget {
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

  const OTBtnBorder({
    super.key,
    this.title = "",
    this.color = OTColors.black,
    this.disableColor = OTColors.grey,
    this.width = OTDimens.d64,
    this.height = OTDimens.d48,
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
      child: isLoading ? OTLoading(type: OTLoadingType.circle) : Text(title),
    );
  }
}

///
/// 渐变按钮组件
///
class OTBtnGradient extends StatelessWidget {
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

  const OTBtnGradient({
    super.key,
    this.title = "",
    this.startColor,
    this.endColor,
    this.disableColor = OTColors.grey,
    this.width = OTDimens.d64,
    this.height = OTDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: OTColors.transparent,
        foregroundColor: startColor!.computeLuminance() > 0.5 ? OTColors.black : OTColors.white,
        elevation: isEnable && !isLoading ? OTDimens.elevationLow : OTDimens.elevationNo,
        padding: const EdgeInsets.all(OTDimens.d0),
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
          borderRadius: BorderRadius.circular(OTDimens.roundRadiusNormal),
        ),
        alignment: Alignment.center,
        child: isLoading ? OTLoading(type: OTLoadingType.circle) : Text(title),
      ),
    );
  }
}

/// 扁平按钮
class OTBtnFlat extends StatelessWidget {
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

  const OTBtnFlat({
    super.key,
    this.title = "",
    this.color = OTColors.grey,
    this.disableColor = OTColors.grey,
    this.width = OTDimens.d64,
    this.height = OTDimens.d48,
    this.isEnable = true,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnable && !isLoading ? color : disableColor,
        foregroundColor: color.computeLuminance() > 0.5 ? OTColors.black : OTColors.white,
        elevation: OTDimens.elevationNo,
        minimumSize: Size(width, height),
      ),
      onPressed: isEnable ? onPressed : null,
      child: isLoading ? OTLoading(type: OTLoadingType.circle) : Text(title),
    );
  }
}

/// 扁平无边界按钮
class OTBtnFlatBorderless extends StatelessWidget {
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

  const OTBtnFlatBorderless({
    super.key,
    this.title = "",
    this.color = OTColors.black,
    this.disableColor = OTColors.grey,
    this.width = OTDimens.d64,
    this.height = OTDimens.d48,
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
      child: isLoading ? OTLoading(type: OTLoadingType.circle) : Text(title),
    );
  }
}
