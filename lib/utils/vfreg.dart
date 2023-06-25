/// id card province dict.
List<String> idCardProvinceDict = [
  '11=北京',
  '12=天津',
  '13=河北',
  '14=山西',
  '15=内蒙古',
  '21=辽宁',
  '22=吉林',
  '23=黑龙江',
  '31=上海',
  '32=江苏',
  '33=浙江',
  '34=安徽',
  '35=福建',
  '36=江西',
  '37=山东',
  '41=河南',
  '42=湖北',
  '43=湖南',
  '44=广东',
  '45=广西',
  '46=海南',
  '50=重庆',
  '51=四川',
  '52=贵州',
  '53=云南',
  '54=西藏',
  '61=陕西',
  '62=甘肃',
  '63=青海',
  '64=宁夏',
  '65=新疆',
  '71=台湾',
  '81=香港',
  '82=澳门',
  '91=国外',
];

///
/// 正则工具类
///
class VFReg {
  /// 简单的手机号正则
  static final String regexMobileSimple = "^[1]\\d{10}\$";

  ///
  /// 复杂的手机号正则
  /// 中国移动: 134(0-8), 135, 136, 137, 138, 139, 147, 150, 151, 152, 157, 158, 159, 178, 182, 183, 184, 187, 188, 198
  /// 中国联通: 130, 131, 132, 145, 155, 156, 166, 171, 175, 176, 185, 186
  /// 中国电信: 133, 153, 173, 177, 180, 181, 189, 199
  /// 卫星电话: 1349
  /// 虚拟电话: 170
  ///
  static final String regexMobileExact =
      "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(16[6])|(17[0,1,3,5-8])|(18[0-9])|(19[1,8,9]))\\d{8}\$";

  /// 电话号码正则
  static final String regexTel = "^0\\d{2,3}[- ]?\\d{7,8}";

  /// 长度为15的身份证号码的正则
  static final String regexIdCard15 =
      "^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$";

  /// 长度为18的身份证号码的正则
  static final String regexIdCard18 =
      "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])\$";

  /// 邮箱正则
  static final String regexEmail =
      "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";

  /// Url 正则
  static final String regexUrl = "[a-zA-z]+://[^\\s]*";

  /// 汉字正则
  static final String regexZh = "[\\u4e00-\\u9fa5]";

  /// 日期正则
  static final String regexDate =
      "^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)\$";

  /// IP 正则
  static final String regexIp =
      "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";

  static final Map<String, String> cityMap = Map();

  ///
  /// 验证手机号 简单
  ///
  static bool isMobileSimple(String input) {
    return matches(regexMobileSimple, input);
  }

  ///
  /// 验证手机号 精确
  ///
  static bool isMobileExact(String input) {
    return matches(regexMobileExact, input);
  }

  ///
  /// 验证电话号码 座机
  ///
  static bool isTel(String input) {
    return matches(regexTel, input);
  }

  ///
  /// 验证身份证号
  ///
  static bool isIDCard(String input) {
    if (input != null && input.length == 15) {
      return isIDCard15(input);
    }
    if (input != null && input.length == 18) {
      return isIDCard18Exact(input);
    }
    return false;
  }

  ///
  /// 验证 15 位身份证
  ///
  static bool isIDCard15(String input) {
    return matches(regexIdCard15, input);
  }

  ///
  /// 验证 18 位身份证 简单
  ///
  static bool isIDCard18(String input) {
    return matches(regexIdCard18, input);
  }

  ///
  /// 验证18 位身份证号 精确
  ///
  static bool isIDCard18Exact(String input) {
    if (isIDCard18(input)) {
      List<int> factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
      List<String> suffix = [
        '1',
        '0',
        'X',
        '9',
        '8',
        '7',
        '6',
        '5',
        '4',
        '3',
        '2'
      ];
      if (cityMap.isEmpty) {
        List<String> list = idCardProvinceDict;
        List<MapEntry<String, String>> mapEntryList = List();
        for (int i = 0, length = list.length; i < length; i++) {
          List<String> tokens = list[i].trim().split("=");
          MapEntry<String, String> mapEntry = MapEntry(tokens[0], tokens[1]);
          mapEntryList.add(mapEntry);
        }
        cityMap.addEntries(mapEntryList);
      }
      if (cityMap[input.substring(0, 2)] != null) {
        int weightSum = 0;
        for (int i = 0; i < 17; ++i) {
          weightSum += (input.codeUnitAt(i) - '0'.codeUnitAt(0)) * factor[i];
        }
        int idCardMod = weightSum % 11;
        String idCardLast = String.fromCharCode(input.codeUnitAt(17));
        return idCardLast == suffix[idCardMod];
      }
    }
    return false;
  }

  ///
  /// 验证邮箱
  ///
  static bool isEmail(String input) {
    return matches(regexEmail, input);
  }

  ///
  /// 验证 Url
  ///
  static bool isURL(String input) {
    return matches(regexUrl, input);
  }

  ///
  /// 验证中文
  ///
  static bool isZh(String input) {
    return '〇' == input || matches(regexZh, input);
  }

  ///
  /// 验证日期
  ///
  static bool isDate(String input) {
    return matches(regexDate, input);
  }

  ///
  /// 验证 IP
  ///
  static bool isIP(String input) {
    return matches(regexIp, input);
  }

  /// 统一处理
  static bool matches(String regex, String input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(regex).hasMatch(input);
  }
}
