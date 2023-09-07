import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

/// 多行文本输入框
class VFEditMultiple extends StatelessWidget {
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

  const VFEditMultiple({
    Key? key,
    this.controller,
    this.hint = "",
    this.borderColor = VFColors.grey,
    this.borderFocusedColor = VFColors.red,
    this.borderWidth = VFDimens.d1,
    this.radius = VFDimens.radiusNormal,
    this.isEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: VFStyles.appTextHint,
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
          VFDimens.paddingNormal,
          VFDimens.paddingSmall,
          VFDimens.paddingNormal,
          VFDimens.paddingSmall,
        ),
      ),
      enabled: isEnable,
      obscureText: false,
      style: VFStyles.appTextEdit,
    );
  }
}
