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
  /// 验证电子邮箱格式
  static const String email = "^\\w+((-\\w+)|(\\.\\w+))*\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+\$";

  /// 简单的手机号正则
  static const String phoneSimple = "^1[23456789]\\d{9}\$";

  ///
  /// 复杂的手机号正则
  /// 中国移动: 134(0-8), 135, 136, 137, 138, 139, 147, 150, 151, 152, 157, 158, 159, 178, 182, 183, 184, 187, 188, 198
  /// 中国联通: 130, 131, 132, 145, 155, 156, 166, 171, 175, 176, 185, 186
  /// 中国电信: 133, 153, 173, 177, 180, 181, 189, 199
  /// 卫星电话: 1349
  /// 虚拟电话: 170
  ///
  static const String phoneExact = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(16[6])|(17[0,1,3,5-8])|(18[0-9])|(19[1,8,9]))\\d{8}\$";

  /// 电话号码正则
  static const String tel = "^0\\d{2,3}[- ]?\\d{7,8}";

  /// 是否固定电话
  static const String landline = "^\\d{3,4}-\\d{7,8}(-\\d{3,4})?\$";

  /// ISO类型的日期格式
  static const String dateISO = "\\d{4}[\\/\\-](0?[1-9]|1[012])[\\/\\-](0?[1-9]|[12][0-9]|3[01])\$";

  /// 日期正则
  static const String date =
      "^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)\$";

  /// 十进制数字
  static const String num = "[\\+-]?(\\d+\\.?\\d*|\\.\\d+|\\d\\.\\d+e\\+\\d+)\$";

  /// 整数
  static const String digits = "\\d+\$";

  /// IP 正则
  static const String ip = "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)";

  /// 长度为15的身份证号码的正则
  static const String idCard15 = "^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$";

  /// 长度为18的身份证号码的正则
  static const String idCard18 = "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])\$";

  /// 是否车牌号
  /// 新能源车牌
  static const String carX = "^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF]\$)|([DF][A-HJ-NP-Z0-9][0-9]{4}\$))";

  /// 旧车牌
  static const String carC = "^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1}\$";
  // if (value.length === 7) {
  //   return creg.test(value);
  // }
  // if (value.length === 8) {
  //   return xreg.test(value);
  // }

  /// 金额，只允许保留两位小数
  static const String amount = "[1-9]\\d*(,\\d{3})*(\\.\\d{1,2})?\$|^0\\.\\d{1,2}\$";

  /// 中文
  static const String chiese = "^[\\u4e00-\\u9fa5]+\$/gi";

  /// 只能输入字母
  static const String en = "[a-zA-Z]*\$";

  /// 只能是字母或者数字
  static const String enOrNum = "^[0-9a-zA-Z]*\$/g";

  /// 是否图片格式
  static const String img = "\\.(jpeg|jpg|gif|png|svg|webp|jfif|bmp|dpg)/i";

  /// 是否视频格式
  static const String video = "\\.(mp4|mpg|mpeg|dat|asf|avi|rm|rmvb|mov|wmv|flv|mkv)/i";

  /// URL格式
  static const String url =
      "^((https|http|ftp|rtsp|mms):\\/\\/)(([0-9a-zA-Z_!~*'().&=+\$%-]+: )?[0-9a-zA-Z_!~*'().&=+\$%-]+@)?(([0-9]{1,3}.){3}[0-9]{1,3}|([0-9a-zA-Z_!~*'()-]+.)*([0-9a-zA-Z][0-9a-zA-Z-]{0,61})?[0-9a-zA-Z].[a-zA-Z]{2,6})(:[0-9]{1,4})?((\\/?)|(\\/[0-9a-zA-Z_!~*'().;?:@&=+\$,%#-]+)+\\/?)\$";

  static final Map<String, String> cityMap = Map();

  ///
  /// 验证手机号 简单
  ///
  static bool isPhoneSimple(String input) {
    return matches(phoneSimple, input);
  }

  ///
  /// 验证手机号 精确
  ///
  static bool isPhoneExact(String input) {
    return matches(phoneExact, input);
  }

  ///
  /// 验证电话号码 座机
  ///
  static bool isTel(String input) {
    return matches(tel, input);
  }

  ///
  /// 验证身份证号
  ///
  static bool isIDCard(String? input) {
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
    return matches(idCard15, input);
  }

  ///
  /// 验证 18 位身份证 简单
  ///
  static bool isIDCard18(String input) {
    return matches(idCard18, input);
  }

  ///
  /// 验证18 位身份证号 精确
  ///
  static bool isIDCard18Exact(String input) {
    if (isIDCard18(input)) {
      List<int> factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
      List<String> suffix = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
      if (cityMap.isEmpty) {
        List<String> list = idCardProvinceDict;
        List<MapEntry<String, String>> mapEntryList = [];
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
    return matches(email, input);
  }

  ///
  /// 验证 Url
  ///
  static bool isURL(String input) {
    return matches(url, input);
  }

  ///
  /// 验证中文
  ///
  static bool isZh(String input) {
    return '〇' == input || matches(chiese, input);
  }

  ///
  /// 验证日期
  ///
  static bool isDate(String input) {
    return matches(date, input);
  }

  ///
  /// 验证 IP
  ///
  static bool isIP(String input) {
    return matches(ip, input);
  }

  /// 统一处理
  static bool matches(String regex, String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(regex).hasMatch(input);
  }
}
