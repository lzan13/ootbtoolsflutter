import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

/// 输入框
class OTEdit extends StatelessWidget {
  // 文本控制器
  final TextEditingController? controller;
  // 提示文本
  final String hint;
  // 图标
  final IconData? iconData;
  // 图标颜色
  final Color? iconColor;
  // 边框样式
  final Color borderColor;
  final Color borderFocusedColor;
  final double borderWidth;
  // 圆形倒角
  final bool isRound;
  // 圆角大小
  final double radius;
  // 隐藏输入
  final bool isObscure;
  // 是否激活
  final bool isEnable;

  const OTEdit({
    super.key,
    this.controller,
    this.hint = "",
    this.iconColor,
    this.iconData,
    this.borderColor = OTColors.grey,
    this.borderFocusedColor = OTColors.red,
    this.borderWidth = OTDimens.d1,
    this.isRound = true,
    this.radius = OTDimens.radiusNormal,
    this.isObscure = false,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: OTTheme.theme().inputDecorationTheme.hintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            isRound ? OTDimens.roundRadiusLarge : radius,
          ),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            isRound ? OTDimens.roundRadiusLarge : radius,
          ),
          borderSide: BorderSide(
            color: borderFocusedColor,
            width: borderWidth,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            isRound ? OTDimens.roundRadiusLarge : radius,
          ),
          borderSide: BorderSide(
            color: borderColor.withAlpha(128),
            width: borderWidth,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(
          OTDimens.paddingNormal,
          OTDimens.paddingSmall,
          OTDimens.paddingNormal,
          OTDimens.paddingSmall,
        ),
        prefixIcon: iconData != null
            ? Container(
                width: OTDimens.d42,
                height: OTDimens.d42,
                alignment: Alignment.center,
                child: OTIcon(
                  data: iconData,
                  color: iconColor,
                ),
              )
            : null,
      ),
      enabled: isEnable,
      obscureText: isObscure,
      style: OTTheme.theme().textTheme.bodyLarge,
    );
  }
}

/// 多行文本输入框
class OTEditMultiple extends StatelessWidget {
  // 文本控制器
  final TextEditingController? controller;
  // 提示文本
  final String hint;
  // 边框样式
  final Color borderColor;
  final Color borderFocusedColor;
  final double borderWidth;
  // 圆角
  final double radius;
  // 是否激活
  final bool isEnable;

  const OTEditMultiple({
    super.key,
    this.controller,
    this.hint = "",
    this.borderColor = OTColors.grey,
    this.borderFocusedColor = OTColors.red,
    this.borderWidth = OTDimens.d1,
    this.radius = OTDimens.radiusNormal,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: OTTheme.theme().inputDecorationTheme.hintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: borderFocusedColor,
            width: borderWidth,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: borderColor.withAlpha(128),
            width: borderWidth,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(
          OTDimens.paddingNormal,
          OTDimens.paddingSmall,
          OTDimens.paddingNormal,
          OTDimens.paddingSmall,
        ),
      ),
      enabled: isEnable,
      obscureText: false,
      style: OTTheme.theme().textTheme.bodyLarge,
    );
  }
}
