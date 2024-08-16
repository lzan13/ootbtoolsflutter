import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

final OTTheme = _OTTheme();

///
/// Create by lzan13 on 2023/8/11
/// 配置类
///
class _OTTheme {
  /// 单例对象
  static late final _OTTheme _instance = _OTTheme._internal();
  // 私有构造方法
  _OTTheme._internal();
  // 工厂方法，创建单例类的实例
  factory _OTTheme() => _instance;

  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

  /// 动态获取当前主题
  ThemeData theme() {
    return Theme.of(OTools.appContext);
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
      dialogBackgroundColor: OTColors.bgDarkDialog,
      disabledColor: OTColors.grey87,
      dividerColor: OTColors.divider,
      primaryColor: OTColors.primary,
      primaryColorDark: OTColors.primaryDark,
      splashColor: OTColors.translucent,
      // splashFactory: NormalNoSplashFactory(),
      highlightColor: Colors.white.withOpacity(0),
      scaffoldBackgroundColor: OTColors.bgDark,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white54),
        backgroundColor: OTColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: OTStyles.appTextHint.copyWith(color: OTColors.white54),
      ),
      primaryTextTheme: TextTheme(
        titleLarge: OTStyles.appTextHeadline6.copyWith(color: OTColors.white87),
        titleMedium: OTStyles.appTextTitle.copyWith(color: OTColors.white87),
        titleSmall: OTStyles.appTextSubtitle.copyWith(color: OTColors.white87),
        bodyLarge: OTStyles.appTextBody.copyWith(color: OTColors.white54),
        bodyMedium: OTStyles.appTextDesc.copyWith(color: OTColors.white54),
        bodySmall: OTStyles.appTextTips.copyWith(color: OTColors.white54),
      ),
      textTheme: TextTheme(
        titleLarge: OTStyles.appTextHeadline6.copyWith(color: OTColors.white87),
        titleMedium: OTStyles.appTextTitle.copyWith(color: OTColors.white87),
        titleSmall: OTStyles.appTextSubtitle.copyWith(color: OTColors.white87),
        bodyLarge: OTStyles.appTextBody.copyWith(color: OTColors.white54),
        bodyMedium: OTStyles.appTextDesc.copyWith(color: OTColors.white54),
        bodySmall: OTStyles.appTextTips.copyWith(color: OTColors.white54),
      ),
      iconTheme: IconThemeData(color: OTColors.white87),
    );
  }

  /// 创建light ThemeData对象
  void _createLightTheme() {
    _lightTheme = ThemeData(
      brightness: Brightness.light,
      dialogBackgroundColor: OTColors.bgLight,
      disabledColor: OTColors.grey87,
      dividerColor: OTColors.divider,
      primaryColor: OTColors.primary,
      primaryColorDark: OTColors.primaryDark,
      splashColor: OTColors.translucent,
      // splashFactory: NormalNoSplashFactory(),
      highlightColor: Colors.white.withOpacity(0),
      scaffoldBackgroundColor: OTColors.bgLight,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: OTColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: OTStyles.appTextHint,
      ),
      primaryTextTheme: TextTheme(
        titleLarge: OTStyles.appTextTitle,
        titleMedium: OTStyles.appTextSubtitle,
        bodyLarge: OTStyles.appTextBody,
        bodyMedium: OTStyles.appTextDesc,
        bodySmall: OTStyles.appTextTips,
      ),
      textTheme: TextTheme(
        titleLarge: OTStyles.appTextTitle,
        titleMedium: OTStyles.appTextSubtitle,
        bodyLarge: OTStyles.appTextBody,
        bodyMedium: OTStyles.appTextDesc,
        bodySmall: OTStyles.appTextTips,
      ),
      iconTheme: IconThemeData(color: OTColors.black87),
    );
  }
}
