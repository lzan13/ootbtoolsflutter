import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';
import 'package:vftools/widgets/vficon.dart';

/// 输入框
class VFEdit extends StatelessWidget {
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

  const VFEdit({
    super.key,
    this.controller,
    this.hint = "",
    this.iconColor,
    this.iconData,
    this.borderColor = VFColors.grey,
    this.borderFocusedColor = VFColors.red,
    this.borderWidth = VFDimens.d1,
    this.isRound = true,
    this.radius = VFDimens.radiusNormal,
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
        hintStyle: VFStyles.appTextHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            isRound ? VFDimens.roundRadiusLarge : radius,
          ),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            isRound ? VFDimens.roundRadiusLarge : radius,
          ),
          borderSide: BorderSide(
            color: borderFocusedColor,
            width: borderWidth,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            isRound ? VFDimens.roundRadiusLarge : radius,
          ),
          borderSide: BorderSide(
            color: borderColor.withAlpha(128),
            width: borderWidth,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(
          VFDimens.paddingNormal,
          VFDimens.paddingSmall,
          VFDimens.paddingNormal,
          VFDimens.paddingSmall,
        ),
        prefixIcon: iconData != null
            ? Container(
                width: VFDimens.d42,
                height: VFDimens.d42,
                alignment: Alignment.center,
                child: VFIcon(
                  data: iconData,
                  color: iconColor,
                ),
              )
            : null,
      ),
      enabled: isEnable,
      obscureText: isObscure,
      style: VFStyles.appTextEdit,
    );
  }
}
