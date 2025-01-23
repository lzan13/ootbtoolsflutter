// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'plugin/ootb_tools_platform.dart';

/// Author: lzan13
/// Date: 2025/01/22
/// Github: https://github.com/lzan13
///
/// Web 端没有 Native 交互，因此它的平台方法需要单独实现
class OToolsWeb extends OToolsPlatform {
  /// 构造方法
  OToolsWeb();

  /// 单独的实例注册
  static void registerWith(Registrar registrar) {
    OToolsPlatform.instance = OToolsWeb();
  }

  /// 获取平台版本
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
