///
/// 自定义 log 工具类
///
class VFLog {
  static const String LOG_TAG = "vflog";

  // debug模式, true: 不输出 d.
  static bool isDebug = true;
  static String TAG = LOG_TAG;

  static void init({bool debug = false, String tag = "vftools"}) {
    isDebug = debug;
    TAG = tag;
  }

  ///
  /// 输出 debug 日志
  ///
  static void d(Object object) {
    if (isDebug) {
      printLog('  debug  ', object);
    }
  }

  ///
  /// 输出 error 日志
  ///
  static void e(Object object) {
    printLog('  error  ', object);
  }

  ///
  /// 最终输出
  ///
  static void printLog(String level, Object object) {
    String msg = object.toString();
    print('-------------------------------------------------------');
    while (msg.isNotEmpty) {
      if (msg.length > 512) {
        print("$TAG $level ${msg.substring(0, 512)}");
        msg = msg.substring(512, msg.length);
      } else {
        print("$TAG $level $msg");
        msg = "";
      }
    }
    print('-------------------------------------------------------');
  }
}
