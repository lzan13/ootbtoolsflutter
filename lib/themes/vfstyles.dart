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
  static final TextStyle appTextTitleLight = appTextTitle.copyWith(
    color: VFColors.white,
  );

  /// 标题文字样式
  static final TextStyle appTextHeadline = appTextTitle.copyWith(
    fontSize: VFSizes.headline,
  );

  /// 内容文字样式
  static final TextStyle appTextBody = TextStyle(
    fontSize: VFSizes.body,
    color: VFColors.black87,
    fontWeight: FontWeight.w300,
  );

  /// TabBar 文字样式
  static final TextStyle appTextTab = TextStyle(
    fontSize: VFSizes.tabNormal,
    color: VFColors.black87,
    fontWeight: FontWeight.w800,
  );
  static final TextStyle appTextTabUnselected = TextStyle(
    fontSize: VFSizes.tabNormal,
    color: VFColors.black54,
    fontWeight: FontWeight.w500,
  );

  /// 输入框文字样式
  static final TextStyle appTextEdit = TextStyle(
    fontSize: VFSizes.body,
    color: VFColors.black87,
    fontWeight: FontWeight.w500,
  );

  /// 输入框文字样式
  static final TextStyle appTextHint = TextStyle(
    fontSize: VFSizes.body,
    color: VFColors.grey87,
    fontWeight: FontWeight.w500,
  );

  /// 描述文字样式
  static final TextStyle appTextDesc = TextStyle(
    fontSize: VFSizes.desc,
    color: VFColors.black87,
    fontWeight: FontWeight.w500,
  );

  /// 更多文字样式
  static final TextStyle appTextMore = TextStyle(
    fontSize: VFSizes.more,
    color: VFColors.black54,
    fontWeight: FontWeight.w500,
  );

  /// tips文字样式
  static final TextStyle appTextTips = TextStyle(
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
