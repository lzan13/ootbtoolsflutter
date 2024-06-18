import 'package:flutter/material.dart';

import 'package:vftools/styles/index.dart';
import 'package:vftools/utils/index.dart';

// 导出插件
export 'plugin/index.dart';
// 导出主题
export 'styles/index.dart';
// 导出小组件
export 'widgets/index.dart';
// 导出工具
export 'utils/index.dart';

final VFTools = _VFTools();

/// 工具库
class _VFTools {
  /// 单例对象
  static final _VFTools _instance = _VFTools._();
  // 私有构造方法
  _VFTools._();
  // 工厂方法，创建单例类的实例
  factory _VFTools() => _instance;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  init(VFOptions options) async {
    VFColors.primary = options.primary;
    VFColors.accent = options.accent;
    VFColors.primaryDark = options.primaryDark;
    VFColors.accentDark = options.accentDark;

    VFLog.init(debug: options.isDebug, tag: options.tag);

    await VFPlatform.init();

    // 初始化 key-value
    await VFKVUtil.init();

    // 初始化主题
    VFTheme.init();
  }

  /// 给根布局的 MaterialApp navigatorKey 属性
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// 获取全局 context
  BuildContext get appContext => _navigatorKey.currentState!.context;
}

///
/// 工具库初始化配置
///
class VFOptions {
  final bool isDebug;
  final String tag;

  final Color primary;
  final Color accent;
  final Color primaryDark;
  final Color accentDark;

  VFOptions({
    this.isDebug = false,
    this.tag = "vftools",
    this.primary = VFColors.white,
    this.accent = VFColors.blue,
    this.primaryDark = VFColors.white,
    this.accentDark = VFColors.blue,
  });
}
