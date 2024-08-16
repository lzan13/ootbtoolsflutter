import 'dart:io';

import 'package:mmkv/mmkv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ootb_platform.dart';

final OTKVUtil = _OTKVUtil();

///
/// Create by lzan13 on 2023/8/31
/// key-value 数据工具类
///
class _OTKVUtil {
  /// app 全局配置数据存储，android/ios 平台使用
  late MMKV _mmkv;

  /// app 全局配置数据存储，全平台使用
  late SharedPreferences _sp;

  /// 是否初始化
  bool isInit = false;

  /// 单例对象
  static final _OTKVUtil _instance = _OTKVUtil._internal();
  // 私有构造方法
  _OTKVUtil._internal();
  // 工厂方法，创建单例类的实例
  factory _OTKVUtil() => _instance;

  ///
  /// 必备数据的初始化操作，由于是同步操作会导致阻塞，所以应尽量减少存储容量
  ///
  init() async {
    if (isInit) return;
    isInit = true;
    if (OTPlatform.isMobile) {
      await MMKV.initialize();
      // 获取 mmkv 实例
      _mmkv = MMKV.defaultMMKV();
    } else {
      _sp = await SharedPreferences.getInstance();
    }
  }

  ///
  /// 保存数据的方法，我们需要拿到保存数据的具体类型，然后根据类型调用不同的保存方法
  /// @param key
  /// @param object
  ///
  put(String key, Object value) {
    if (OTPlatform.isMobile) {
      if (value is String) {
        _mmkv.encodeString(key, value);
      } else if (value is int) {
        _mmkv.encodeInt(key, value);
      } else if (value is bool) {
        _mmkv.encodeBool(key, value);
      } else if (value is double) {
        _mmkv.encodeDouble(key, value);
      } else {
        _mmkv.encodeString(key, value.toString());
      }
    } else {
      if (value is String) {
        _sp.setString(key, value);
      } else if (value is int) {
        _sp.setInt(key, value);
      } else if (value is bool) {
        _sp.setBool(key, value);
      } else if (value is double) {
        _sp.setDouble(key, value);
      } else {
        _sp.setString(key, value.toString());
      }
    }
  }

  ///
  /// 获取值
  ///
  String getString(String key, {String defValue = ""}) {
    if (OTPlatform.isMobile) {
      return _mmkv.decodeString(key) ?? defValue;
    } else {
      return _sp.getString(key) ?? defValue;
    }
  }

  int getInt(String key, {int defValue = 0}) {
    if (OTPlatform.isMobile) {
      return _mmkv.decodeInt(key, defaultValue: defValue);
    } else {
      return _sp.getInt(key) ?? defValue;
    }
  }

  bool getBool(String key, {bool defValue = false}) {
    if (OTPlatform.isMobile) {
      return _mmkv.decodeBool(key, defaultValue: defValue);
    } else {
      return _sp.getBool(key) ?? defValue;
    }
  }

  double getDouble(String key, {double defValue = 0.0}) {
    if (OTPlatform.isMobile) {
      return _mmkv.decodeDouble(key, defaultValue: defValue);
    } else {
      return _sp.getDouble(key) ?? defValue;
    }
  }

  ///
  /// 移除指定值
  ///
  void remove(String key) {
    if (OTPlatform.isMobile) {
      _mmkv.removeValue(key);
    } else {
      _sp.remove(key);
    }
  }

  ///
  /// 移除全部值
  ///
  void clear() {
    if (OTPlatform.isMobile) {
      _mmkv.clearAll();
    } else {
      _sp.clear();
    }
  }

  ///
  /// ----------------------------- 主题数据 -----------------------------
  ///
  ///

  ///
  /// 设置黑暗模式
  // //
  // static Future<bool> setDarkMode(mode) {
  //   return sharedPreferences.setBool(Configs.KEY_THEME_DARK_MODE, mode);
  // }

  // static bool getDarkMode() {
  //   return sharedPreferences.getBool(Configs.KEY_THEME_DARK_MODE) ?? false;
  // }

  // ///
  // /// 设置主题样式
  // ///
  // static Future<bool> setThemeIndex(index) {
  //   return sharedPreferences.setInt(Configs.KEY_THEME_COLOR_INDEX, index);
  // }

  // static int getThemeIndex() {
  //   return sharedPreferences.getInt(Configs.KEY_THEME_COLOR_INDEX) ?? 9;
  // }

  // ///
  // /// 设置文字
  // ///
  // static Future<bool> setFontIndex(index) {
  //   return sharedPreferences.setInt(Configs.KEY_FONT_INDEX, index);
  // }

  // static int getFontIndex() {
  //   return sharedPreferences.getInt(Configs.KEY_FONT_INDEX) ?? 0;
  // }

  // ///
  // /// 设置当前语言
  // ///
  // static Future<bool> setLanguageIndex(index) {
  //   return sharedPreferences.setInt(Configs.KEY_LOCAL_INDEX, index);
  // }

  // static int getLanguageIndex() {
  //   return sharedPreferences.getInt(Configs.KEY_LOCAL_INDEX) ?? 0;
  // }
}
