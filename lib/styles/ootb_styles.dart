import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

class OTStyles {
  /// 大标题文字样式
  static final TextStyle appTextHeadline1 = appTextTitle.copyWith(fontSize: OTSizes.headline1);
  static final TextStyle appTextHeadline2 = appTextTitle.copyWith(fontSize: OTSizes.headline2);
  static final TextStyle appTextHeadline3 = appTextTitle.copyWith(fontSize: OTSizes.headline3);
  static final TextStyle appTextHeadline4 = appTextTitle.copyWith(fontSize: OTSizes.headline4);
  static final TextStyle appTextHeadline5 = appTextTitle.copyWith(fontSize: OTSizes.headline5);
  static final TextStyle appTextHeadline6 = appTextTitle.copyWith(fontSize: OTSizes.headline6);

  /// 标题文字样式
  static TextStyle appTextTitle = const TextStyle(
    fontSize: OTSizes.title,
    color: OTColors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  /// 副标题文字样式
  static TextStyle appTextSubtitle = appTextTitle.copyWith(
    fontSize: OTSizes.subtitle,
    fontWeight: FontWeight.w500,
  );

  /// 内容文字样式
  static TextStyle appTextBody = appTextTitle.copyWith(
    fontSize: OTSizes.body,
    fontWeight: FontWeight.w400,
    color: OTColors.black87,
  );

  /// 描述文字样式
  static TextStyle appTextDesc = appTextBody.copyWith(
    fontSize: OTSizes.desc,
    color: OTColors.greyBlack87,
  );

  /// tips文字样式，一般用于很小的文字
  static TextStyle appTextTips = appTextBody.copyWith(
    fontSize: OTSizes.tips,
    color: OTColors.greyBlack54,
  );

  /// TabBar 文字样式
  static TextStyle appTextTab = appTextTitle.copyWith(
    fontSize: OTSizes.tabNormal,
    color: OTColors.accent,
    fontWeight: FontWeight.w600,
  );
  static TextStyle appTextTabUnselected = appTextTab.copyWith(
    color: OTColors.greyBlack87,
    fontWeight: FontWeight.w500,
  );

  /// 输入框文字样式
  static TextStyle appTextEdit = appTextBody.copyWith(
    fontSize: OTSizes.input,
  );

  /// 输入框文字提醒样式
  static TextStyle appTextHint = appTextEdit.copyWith(
    color: OTColors.grey87,
  );

  /// 盒子投影
  static final List<BoxShadow> boxShadowPrimary = [
    BoxShadow(
      color: OTColors.accent54,
      offset: const Offset(0, OTDimens.elevationNormal),
      blurRadius: OTDimens.blurRadiusLarge,
    )
  ];
  static final List<BoxShadow> boxShadowBlack = [
    BoxShadow(
      color: OTColors.black38,
      offset: const Offset(0, OTDimens.elevationNormal),
      blurRadius: OTDimens.blurRadiusLarge,
    )
  ];
  static final List<BoxShadow> boxShadowWhite = [
    BoxShadow(
      color: OTColors.white38,
      offset: const Offset(0, OTDimens.elevationNormal),
      blurRadius: OTDimens.blurRadiusLarge,
    )
  ];
}
