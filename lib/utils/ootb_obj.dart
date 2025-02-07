/// author: lzan13
/// date: 2023/08/31
/// github: https://github.com/lzan13
///
/// 对象操作工具类
class OTObj {
  ///
  /// 判断对象是否为空
  ///
  static bool isEmpty(Object? object) {
    if (object == null) {
      return true;
    }
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }

  ///
  /// 判断不为空
  ///
  static bool isNotEmpty(Object object) {
    return !isEmpty(object);
  }

  ///
  /// 比较两个列表
  ///
  static bool equalList(List? listA, List? listB) {
    if (listA == null || listB == null) {
      return false;
    }
    if (listA == listB) {
      return true;
    }
    int length = listA.length;
    if (length != listB.length) return false;
    for (int i = 0; i < length; i++) {
      if (!listA.contains(listB[i])) {
        return false;
      }
    }
    return true;
  }
}
