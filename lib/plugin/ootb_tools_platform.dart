import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ootb_tools_channel.dart';

///
/// 平台接口定义
///
abstract class OTToolsPlatform extends PlatformInterface {
  /// 构造方法
  OTToolsPlatform() : super(token: _token);

  static final Object _token = Object();

  /// 使用[OTToolsPlatform]的默认实现，这里默认是[OTToolsChannel]
  static OTToolsPlatform _instance = OTToolsChannel();
  static OTToolsPlatform get instance => _instance;

  /// 特定平台应该由指定平台自己扩展[OTToolsPlatform]实现并注册进来
  static set instance(OTToolsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// 获取平台版本
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() 方法未实现！');
  }

  /// Flutter -> Native 传参
  Future<dynamic> callNative(Map<String, Object> params) async {
    UnimplementedError('callNative() 方法未实现！');
  }
}
