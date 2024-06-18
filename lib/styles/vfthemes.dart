import 'package:flutter/material.dart';

import 'package:vftools/vftools.dart';

final VFTheme = _VFTheme();

///
/// Create by lzan13 on 2023/8/11
/// 配置类
///
class _VFTheme {
  /// 单例对象
  static late final _VFTheme _instance = _VFTheme._internal();
  // 私有构造方法
  _VFTheme._internal();
  // 工厂方法，创建单例类的实例
  factory _VFTheme() => _instance;

  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

  /// 动态获取当前主题
  ThemeData theme() {
    return Theme.of(VFTools.appContext);
  }

  ///
  /// 初始化主题
  ///
  init() {
    _createDarkTheme();
    _createLightTheme();
  }

  /// 创建Dark ThemeData对象
  void _createDarkTheme() {
    _darkTheme = ThemeData(
      brightness: Brightness.dark,
      dialogBackgroundColor: VFColors.bgDarkDialog,
      disabledColor: VFColors.grey87,
      dividerColor: VFColors.divider,
      primaryColor: VFColors.primary,
      primaryColorDark: VFColors.primaryDark,
      splashColor: VFColors.translucent,
      // splashFactory: NormalNoSplashFactory(),
      highlightColor: Colors.white.withOpacity(0),
      scaffoldBackgroundColor: VFColors.bgDark,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white54),
        backgroundColor: VFColors.primary,
      ),
      primaryTextTheme: TextTheme(
        titleLarge: VFStyles.appTextHeadline6.copyWith(color: VFColors.white87),
        titleMedium: VFStyles.appTextTitle.copyWith(color: VFColors.white87),
        titleSmall: VFStyles.appTextSubtitle.copyWith(color: VFColors.white87),
        bodyLarge: VFStyles.appTextBody.copyWith(color: VFColors.white54),
        bodyMedium: VFStyles.appTextDesc.copyWith(color: VFColors.white54),
        bodySmall: VFStyles.appTextTips.copyWith(color: VFColors.white54),
      ),
      textTheme: TextTheme(
        titleLarge: VFStyles.appTextHeadline6.copyWith(color: VFColors.white87),
        titleMedium: VFStyles.appTextTitle.copyWith(color: VFColors.white87),
        titleSmall: VFStyles.appTextSubtitle.copyWith(color: VFColors.white87),
        bodyLarge: VFStyles.appTextBody.copyWith(color: VFColors.white54),
        bodyMedium: VFStyles.appTextDesc.copyWith(color: VFColors.white54),
        bodySmall: VFStyles.appTextTips.copyWith(color: VFColors.white54),
      ),
      iconTheme: IconThemeData(color: VFColors.white87),
    );
  }

  /// 创建light ThemeData对象
  void _createLightTheme() {
    _lightTheme = ThemeData(
      brightness: Brightness.light,
      dialogBackgroundColor: VFColors.bgLight,
      disabledColor: VFColors.grey87,
      dividerColor: VFColors.divider,
      primaryColor: VFColors.primary,
      primaryColorDark: VFColors.primaryDark,
      splashColor: VFColors.translucent,
      // splashFactory: NormalNoSplashFactory(),
      highlightColor: Colors.white.withOpacity(0),
      scaffoldBackgroundColor: VFColors.bgLight,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: VFColors.primary,
      ),
      primaryTextTheme: TextTheme(
        titleLarge: VFStyles.appTextTitle,
        titleMedium: VFStyles.appTextSubtitle,
        bodyLarge: VFStyles.appTextBody,
        bodyMedium: VFStyles.appTextDesc,
        bodySmall: VFStyles.appTextTips,
      ),
      textTheme: TextTheme(
        titleLarge: VFStyles.appTextTitle,
        titleMedium: VFStyles.appTextSubtitle,
        bodyLarge: VFStyles.appTextBody,
        bodyMedium: VFStyles.appTextDesc,
        bodySmall: VFStyles.appTextTips,
      ),
      iconTheme: IconThemeData(color: VFColors.black87),
    );
  }
}
