import 'dart:io';
import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

///
/// 获取平台信息的工具类
class VFPlatform {
  /// 是否是生产环境
  static const bool inProduction = bool.fromEnvironment("dart.vm.product");

  ///
  /// 获取包信息
  ///
  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  ///
  /// 获取 App 版本
  ///
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  ///
  /// 获取 App 编译号
  ///
  static Future<String> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  ///
  /// 获取设备信息
  ///
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }
}
