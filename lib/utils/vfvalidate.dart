///
/// 策略类
///
class VFStrategies {
  // 是否必填
  String require(value, String message) {
    return (value == null || value == '' || value == 0) ? message : '';
  }

  // 正则匹配
  String pattern(String value, String reg, String message) {
    return RegExp(reg).hasMatch(value) ? '' : message;
  }

  // 最小长度
  String minLength(value, int len, String message) {
    if (value is String) {
      return value.length >= len ? '' : message;
    }
    if (value is int || value is double) {
      var _number = value.toDouble();
      return _number >= len ? '' : message;
    }
    return message;
  }

  // 最大长度
  String maxLength(value, int len, String message) {
    if (value is String) {
      return value.length <= len ? '' : message;
    }
    if (value is int || value is double) {
      var _number = value.toDouble();
      return _number <= len ? '' : message;
    }
    return message;
  }
}

///
/// 验证类
///
class VFValidate extends VFStrategies {
  final params;
  final rules;

  final List<Function> validateList = [];

  VFValidate(this.params, this.rules) {
    init(rules);
  }

  ///
  /// 验证
  ///
  String verify() {
    for (var index = 0; index < validateList.length; index++) {
      var message = validateList[index]();
      if (message != '') {
        return validateList[index]();
      }
    }
    return "";
  }

  ///
  /// 初始化规则
  ///
  void init(rules) {
    var strategies = {
      'require': require,
      'pattern': pattern,
      'minLength': minLength,
      'maxLength': maxLength,
    };
    rules.forEach((keyIndex, ruleValue) {
      var _value = params[keyIndex];
      var _iterator = rules[keyIndex];
      _iterator.forEach((item) {
        item.forEach((key, value) {
          if (strategies.containsKey(key)) {
            if (key == 'require' && value == true) {
              validateList.add(() {
                return strategies[key]!(_value, item['message']);
              });
            } else {
              validateList.add(() {
                return strategies[key]!(_value, item[key], item['message']);
              });
            }
          }
        });
      });
    });
  }
}
