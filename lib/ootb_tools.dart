import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/styles/index.dart';
import 'package:ootbtoolsflutter/utils/index.dart';

// 导出插件
export 'plugin/index.dart';
// 导出主题
export 'styles/index.dart';
// 导出小组件
export 'widgets/index.dart';
// 导出工具
export 'utils/index.dart';

final OTools = _OTools();

/// 工具库
class _OTools {
  /// 单例对象
  static final _OTools _instance = _OTools._();
  // 私有构造方法
  _OTools._();
  // 工厂方法，创建单例类的实例
  factory _OTools() => _instance;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  init(OTOptions options) async {
    OTColors.primary = options.primary;
    OTColors.accent = options.accent;
    OTColors.primaryDark = options.primaryDark;
    OTColors.accentDark = options.accentDark;

    OTLog.init(debug: options.isDebug, tag: options.tag);

    await OTPlatform.init();

    // 初始化 key-value
    await OTKVUtil.init();

    // 初始化主题
    OTTheme.init();
  }

  /// 给根布局的 MaterialApp navigatorKey 属性
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// 获取全局 context
  BuildContext get appContext => _navigatorKey.currentState!.context;
}

///
/// 工具库初始化配置
///
class OTOptions {
  final bool isDebug;
  final String tag;

  final Color primary;
  final Color accent;
  final Color primaryDark;
  final Color accentDark;

  OTOptions({
    this.isDebug = false,
    this.tag = "ootbtools",
    this.primary = OTColors.white,
    this.accent = OTColors.blue,
    this.primaryDark = OTColors.white,
    this.accentDark = OTColors.blue,
  });
}
