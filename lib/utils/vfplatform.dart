import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vftools/utils/vflog.dart';

///
/// Create by lzan13 on 2023/9/3
/// 获取平台信息的工具类
///
class VFPlatform {
  /// 单例对象
  static late final VFPlatform _instance = VFPlatform._internal();
  // 私有构造方法
  VFPlatform._internal();
  // 工厂方法，创建单例类的实例
  factory VFPlatform() => _instance;

  /// DeviceInfo 相关信息
  late Map<String, dynamic> _deviceInfo;

  /// PackageInfo 相关信息
  late PackageInfo _packageInfo;
  late String _appName;
  late String _appVersion;

  ///
  /// 初始化平台工具类
  ///
  init() async {
    initDeviceInfo();
    _packageInfo = await PackageInfo.fromPlatform();

    _appName = _packageInfo.appName;
    _appVersion = _packageInfo.version;
  }

  /// 判断平台
  static bool get isWeb => kIsWeb;
  static bool get isAndroid => isWeb ? false : Platform.isAndroid;
  static bool get isIOS => isWeb ? false : Platform.isIOS;
  static bool get isLinux => isWeb ? false : Platform.isLinux;
  static bool get isMacOS => isWeb ? false : Platform.isMacOS;
  static bool get isWindows => isWeb ? false : Platform.isWindows;
  static bool get isFuchsia => isWeb ? false : Platform.isFuchsia;

  /// 获取包信息
  PackageInfo getAppPackageInfo() => _packageInfo;
  // 获取 AppName
  String getAppName() => _appName;
  // 获取 App 版本
  String getAppVersion() => _appVersion;

  ///
  /// 初始化设备信息
  ///
  initDeviceInfo() async {
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
    VFLog.d(_deviceInfo);
  }

  /// 获取设备信息
  Map<String, dynamic> getDeviceInfo() => _deviceInfo;

  ///
  /// 获取指定平台deviceInfo
  ///
  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo data) {
    return <String, dynamic>{
      'uniqueId': data.id.toLowerCase(),
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
      'displaySizeInches':
          ((data.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': data.displayMetrics.widthPx,
      'displayWidthInches': data.displayMetrics.widthInches,
      'displayHeightPixels': data.displayMetrics.heightPx,
      'displayHeightInches': data.displayMetrics.heightInches,
      'displayXDpi': data.displayMetrics.xDpi,
      'displayYDpi': data.displayMetrics.yDpi,
      'serialNumber': data.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'uniqueId': data.identifierForVendor?.toLowerCase() ?? "",
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
    return <String, dynamic>{
      'uniqueId': data.id.toLowerCase(),
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
    return <String, dynamic>{
      'uniqueId': data.systemGUID?.toLowerCase() ?? "",
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
    return <String, dynamic>{
      'uniqueId': data.deviceId.replaceAll(RegExp(r'[{}]'), '').toLowerCase(),
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
    return <String, dynamic>{
      'uniqueId': "webId",
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
