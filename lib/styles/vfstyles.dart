import 'package:flutter/material.dart';

import 'package:vftools/vftools.dart';

class VFStyles {
  /// 大标题文字样式
  static final TextStyle appTextHeadline1 = appTextTitle.copyWith(fontSize: VFSizes.headline1);
  static final TextStyle appTextHeadline2 = appTextTitle.copyWith(fontSize: VFSizes.headline2);
  static final TextStyle appTextHeadline3 = appTextTitle.copyWith(fontSize: VFSizes.headline3);
  static final TextStyle appTextHeadline4 = appTextTitle.copyWith(fontSize: VFSizes.headline4);
  static final TextStyle appTextHeadline5 = appTextTitle.copyWith(fontSize: VFSizes.headline5);
  static final TextStyle appTextHeadline6 = appTextTitle.copyWith(fontSize: VFSizes.headline6);

  /// 标题文字样式
  static TextStyle appTextTitle = const TextStyle(
    fontSize: VFSizes.title,
    color: VFColors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  /// 副标题文字样式
  static TextStyle appTextSubtitle = appTextTitle.copyWith(
    fontSize: VFSizes.subtitle,
    fontWeight: FontWeight.w500,
  );

  /// 内容文字样式
  static TextStyle appTextBody = appTextTitle.copyWith(
    fontSize: VFSizes.body,
    fontWeight: FontWeight.w400,
    color: VFColors.black87,
  );

  /// 描述文字样式
  static TextStyle appTextDesc = appTextBody.copyWith(
    fontSize: VFSizes.desc,
    color: VFColors.greyBlack87,
  );

  /// tips文字样式，一般用于很小的文字
  static TextStyle appTextTips = appTextBody.copyWith(
    fontSize: VFSizes.tips,
    color: VFColors.greyBlack54,
  );

  /// TabBar 文字样式
  static TextStyle appTextTab = appTextTitle.copyWith(
    fontSize: VFSizes.tabNormal,
    color: VFColors.accent,
    fontWeight: FontWeight.w600,
  );
  static TextStyle appTextTabUnselected = appTextTab.copyWith(
    color: VFColors.greyBlack87,
    fontWeight: FontWeight.w500,
  );

  /// 输入框文字样式
  static TextStyle appTextEdit = appTextBody.copyWith(
    fontSize: VFSizes.input,
  );

  /// 输入框文字提醒样式
  static TextStyle appTextHint = appTextEdit.copyWith(
    color: VFColors.grey87,
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
    BoxShadow(
      color: VFColors.black38,
      offset: const Offset(0, VFDimens.elevationNormal),
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
