import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';
import 'package:vftools/utils/vfutils.dart';

/// 导出常量工具

// 导出插件
export 'plugin/vfplugin.dart';
// 导出主题
export 'themes/vfthemes.dart';
// 导出小组件
export 'widgets/vfwidgets.dart';
// 导出工具
export 'utils/vfutils.dart';

class VFTools {
  /// 单例对象
  static late final VFTools _instance = VFTools._internal();
  // 私有构造方法
  VFTools._internal();
  // 工厂方法，创建单例类的实例
  factory VFTools() => _instance;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  init(VFOptions options) {
    VFColors.primary = options.primary;
    VFColors.accent = options.accent;

    VFPlatform().init();
  }

  /// 给根布局的 MaterialApp navigatorKey 属性
  GlobalKey<NavigatorState> get navigatorKey => _instance._navigatorKey;

  /// 获取全局 context
  BuildContext? get appContext => _instance._navigatorKey.currentState?.context;
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
