import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// 引入平台接口定义
import 'ootb_tools_platform.dart';

///
/// [OToolsPlatform]的通道实现
///
class OToolsChannel extends OToolsPlatform {
  /// 与 Native 交互的通道实例
  @visibleForTesting
  final mChannel = const MethodChannel('ootbtoolsflutter');

  ///
  /// 获取平台版本方法实现，这里会通过 Channel 调用到 Native 层
  ///
  @override
  Future<String?> getPlatformVersion() async {
    final version = await mChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Flutter -> Native
  @override
  Future<dynamic> callNative(Map<String, Object> params) async {
    await mChannel.invokeMethod("callNative", params);
  }
}
