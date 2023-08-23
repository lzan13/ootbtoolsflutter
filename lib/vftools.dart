import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

/// 导出常量工具

/// 导出插件
export 'plugin/vfplugin.dart';

/// 导出主题
export 'themes/vfthemes.dart';

/// 导出小组件
export 'widgets/vfwidgets.dart';

/// 导出工具
export 'utils/vfutils.dart';

class VFTools {
  static final VFTools _instance = VFTools();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static void init(VFOptions options) {
    VFColors.primary = options.primary;
    VFColors.accent = options.accent;
  }

  /// 给根布局的 MaterialApp navigatorKey 属性
  static GlobalKey<NavigatorState> get navigatorKey => _instance._navigatorKey;

  /// 获取全局 context
  static BuildContext? get appContext =>
      _instance._navigatorKey.currentState?.context;
}

///
/// 工具库初始化配置
///
class VFOptions {
  final Color primary;
  final Color accent;
  VFOptions({
    this.primary = VFColors.white,
    this.accent = VFColors.orange,
  });
}
