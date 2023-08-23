import 'package:flutter/material.dart';
import 'package:vftools/themes/vfcolors.dart';
import 'package:vftools/themes/vfdimens.dart';

class VFStyles {
  /// 标题文字样式
  static const TextStyle appTextTitle = TextStyle(
    fontSize: VFSizes.title,
    color: VFColors.black,
    fontWeight: FontWeight.bold,
  );

  /// 亮色标题
  static TextStyle appTextTitleLight = appTextTitle.copyWith(
    color: VFColors.white,
  );

  /// 标题文字样式
  static TextStyle appTextHeadline = appTextTitle.copyWith(
    fontSize: VFSizes.headline,
  );

  /// 内容文字样式
  static const TextStyle appTextBody = TextStyle(
    fontSize: VFSizes.body,
    color: VFColors.black54,
    fontWeight: FontWeight.w300,
  );

  /// 输入框文字样式
  static const TextStyle appTextEdit = TextStyle(
    fontSize: VFSizes.body,
    color: VFColors.black87,
    fontWeight: FontWeight.w400,
  );

  /// 输入框文字样式
  static const TextStyle appTextHint = TextStyle(
    fontSize: VFSizes.body,
    color: VFColors.grey87,
    fontWeight: FontWeight.w400,
  );

  /// 更多文字样式
  static const TextStyle appTextMore = TextStyle(
    fontSize: VFSizes.more,
    color: VFColors.black54,
    fontWeight: FontWeight.w500,
  );

  /// tips文字样式
  static const TextStyle appTextTips = TextStyle(
    fontSize: VFSizes.tips,
    color: VFColors.black54,
    fontWeight: FontWeight.w500,
  );

  /// 盒子投影
  static final List<BoxShadow> boxShadowPrimary = [
    BoxShadow(
      color: VFColors.accent54,
      offset: const Offset(0, VFDimens.elevationNormal),
      blurRadius: VFDimens.blurRadiusLarge,
    )
  ];
  static final List<BoxShadow> boxShadowBlack = [
    const BoxShadow(
      color: VFColors.black38,
      offset: Offset(0, VFDimens.elevationNormal),
      blurRadius: VFDimens.blurRadiusLarge,
    )
  ];
  static final List<BoxShadow> boxShadowWhite = [
    BoxShadow(
      color: VFColors.white38,
      offset: const Offset(0, VFDimens.elevationNormal),
      blurRadius: VFDimens.blurRadiusLarge,
    )
  ];
}
