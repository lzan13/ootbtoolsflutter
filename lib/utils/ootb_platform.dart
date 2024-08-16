import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

final OTPlatform = _OTPlatform();

///
/// Create by lzan13 on 2023/9/3
/// 获取平台信息的工具类
///
class _OTPlatform {
  /// 单例对象
  static late final _OTPlatform _instance = _OTPlatform._();
  // 私有构造方法
  _OTPlatform._();
  // 工厂方法，创建单例类的实例
  factory _OTPlatform() => _instance;

  /// DeviceInfo 相关信息
  late Map<String, dynamic> _deviceInfo;
  String _deviceId = "";

  /// PackageInfo 相关信息
  late PackageInfo _packageInfo;
  late String _appName;
  late String _appVersion;

  /// 判断平台
  bool get isWeb => kIsWeb;
  bool get isAndroid => isWeb ? false : Platform.isAndroid;
  bool get isIOS => isWeb ? false : Platform.isIOS;
  bool get isLinux => isWeb ? false : Platform.isLinux;
  bool get isMacOS => isWeb ? false : Platform.isMacOS;
  bool get isWindows => isWeb ? false : Platform.isWindows;
  bool get isFuchsia => isWeb ? false : Platform.isFuchsia;
  // 移动平台
  bool get isMobile => isAndroid || isFuchsia || isIOS;
  // 桌面平台
  bool get isDesktop => isLinux || isMacOS || isWindows;

  /// 获取设备id
  String getDeviceId() => _deviceId;

  /// 获取设备信息
  Map<String, dynamic> getDeviceInfo() => _deviceInfo;

  /// 获取包信息
  PackageInfo getAppPackageInfo() => _packageInfo;
  // 获取 AppName
  String getAppName() => _appName;
  // 获取 App 版本
  String getAppVersion() => _appVersion;

  ///
  /// 初始化平台工具类
  ///
  init() async {
    await _setupPackageInfo();

    await _setupDeviceInfo();

    if (isAndroid) {
      await _setupAndroidId();
    }

    // OTLog.d(_deviceInfo);
  }

  ///
  /// 初始化包信息
  ///
  _setupPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();

    _appName = _packageInfo.appName;
    _appVersion = _packageInfo.version;
  }

  ///
  /// 初始化设备信息
  ///
  _setupDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (kIsWeb) {
      _deviceInfo = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    } else if (Platform.isAndroid) {
      _deviceInfo = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      _deviceInfo = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    } else if (Platform.isLinux) {
      _deviceInfo = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
    } else if (Platform.isMacOS) {
      _deviceInfo = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
    } else if (Platform.isWindows) {
      _deviceInfo = _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
    } else {
      // todo 不支持的平台
      _deviceInfo = <String, dynamic>{};
    }
  }

  // 初始化 android id
  _setupAndroidId() async {
    if (isAndroid) {
      const androidIdPlugin = AndroidId();
      final androidId = await androidIdPlugin.getId() ?? "";
      _deviceId = androidId.toLowerCase();
      _deviceInfo['uniqueId'] = _deviceId;
    }
  }

  ///
  /// 获取指定平台deviceInfo
  ///
  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo data) {
    _deviceId = data.id.toLowerCase();
    return <String, dynamic>{
      'uniqueId': _deviceId,
      'version.securityPatch': data.version.securityPatch,
      'version.sdkInt': data.version.sdkInt,
      'version.release': data.version.release,
      'version.previewSdkInt': data.version.previewSdkInt,
      'version.incremental': data.version.incremental,
      'version.codename': data.version.codename,
      'version.baseOS': data.version.baseOS,
      'board': data.board,
      'bootloader': data.bootloader,
      'brand': data.brand,
      'device': data.device,
      'display': data.display,
      'fingerprint': data.fingerprint,
      'hardware': data.hardware,
      'host': data.host,
      'id': data.id,
      'manufacturer': data.manufacturer,
      'model': data.model,
      'product': data.product,
      'supported32BitAbis': data.supported32BitAbis,
      'supported64BitAbis': data.supported64BitAbis,
      'supportedAbis': data.supportedAbis,
      'tags': data.tags,
      'type': data.type,
      'isPhysicalDevice': data.isPhysicalDevice,
      'systemFeatures': data.systemFeatures,
      'serialNumber': data.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    _deviceId = data.identifierForVendor?.toLowerCase() ?? "";
    return <String, dynamic>{
      'uniqueId': _deviceId,
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    _deviceId = data.machineId?.toLowerCase() ?? "";
    return <String, dynamic>{
      'uniqueId': _deviceId,
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    _deviceId = data.systemGUID?.toLowerCase() ?? "";
    return <String, dynamic>{
      'uniqueId': _deviceId,
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'patchVersion': data.patchVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    _deviceId = data.deviceId.replaceAll(RegExp(r'[{}]'), '').toLowerCase();
    return <String, dynamic>{
      'uniqueId': _deviceId,
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
      'userName': data.userName,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'buildNumber': data.buildNumber,
      'platformId': data.platformId,
      'csdVersion': data.csdVersion,
      'servicePackMajor': data.servicePackMajor,
      'servicePackMinor': data.servicePackMinor,
      'suitMask': data.suitMask,
      'productType': data.productType,
      'reserved': data.reserved,
      'buildLab': data.buildLab,
      'buildLabEx': data.buildLabEx,
      'digitalProductId': data.digitalProductId,
      'displayVersion': data.displayVersion,
      'editionId': data.editionId,
      'installDate': data.installDate,
      'productId': data.productId,
      'productName': data.productName,
      'registeredOwner': data.registeredOwner,
      'releaseId': data.releaseId,
      'deviceId': data.deviceId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    _deviceId = '${data.vendor ?? '-'} + ${data.userAgent ?? '-'} + ${data.hardwareConcurrency.toString()}';
    return <String, dynamic>{
      'uniqueId': _deviceId,
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }
}
