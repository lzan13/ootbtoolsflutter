///
/// 自定义 log 工具类
///
class OTLog {
  static const String logTag = "ootbtoolsflutter";

  // debug 模式, true: 不输出 d.
  static bool isDebug = true;
  static String tag = logTag;

  static void init({bool debug = false, String tag = "ootbtoolsflutter"}) {
    isDebug = debug;
    tag = tag;
  }

  // Sample of abstract logging function
  static void write(String content, {bool isError = false}) {
    Future.microtask(() => print('** $content. isError: [$isError]'));
  }

  /// 输出 debug 日志
  static void d(Object object) {
    if (isDebug) {
      printLog('debug', object);
    }
  }

  /// 输出 error 日志
  static void e(Object object) {
    printLog('error', object);
  }

  /// 最终输出
  static void printLog(String level, Object object) {
    String msg = object.toString();
    print('-------------------------------------------------------');
    while (msg.isNotEmpty) {
      if (msg.length > 512) {
        print("$tag $level ${msg.substring(0, 512)}");
        msg = msg.substring(512, msg.length);
      } else {
        print("$tag $level $msg");
        msg = "";
      }
    }
    print('-------------------------------------------------------');
  }
}
