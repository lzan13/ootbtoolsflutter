/// author: lzan13
/// date: 2025/01/22
/// github: https://github.com/lzan13
///
/// 时间日期工具类
enum DateFormat {
  defaultMilli, //yyyy-MM-dd HH:mm:ss.SSS
  normal, //yyyy-MM-dd HH:mm:ss
  yearMonthDayHourMinute, //yyyy-MM-dd HH:mm
  yearMonthDay, //yyyy-MM-dd
  yearMonth, //yyyy-MM
  monthDay, //MM-dd
  monthDayHourMinute, //MM-dd HH:mm
  hourMinuteSecond, //HH:mm:ss
  hourMinute, //HH:mm

  zhDefaultMilli, //yyyy年MM月dd日 HH时mm分ss秒SSS毫秒
  zhNormal, //yyyy年MM月dd日 HH时mm分ss秒  /  timeSeparate: ":" --> yyyy年MM月dd日 HH:mm:ss
  zhYearMonthDayHourMinute, //yyyy年MM月dd日 HH时mm分  /  timeSeparate: ":" --> yyyy年MM月dd日 HH:mm
  zhYearMonthDay, //yyyy年MM月dd日
  zhYearMonth, //yyyy年MM月
  zhMonthDay, //MM月dd日
  zhMonthDayHourMinute, //MM月dd日 HH时mm分  /  timeSeparate: ":" --> MM月dd日 HH:mm
  zhHourMinuteSecond, //HH时mm分ss秒
  zhHourMinute, //HH时mm分
}

/// 一些常用格式参照。可以自定义格式，例如："yyyy/MM/dd HH:mm:ss"，"yyyy/M/d HH:mm:ss"。
/// 格式要求
/// year -> yyyy/yy   month -> MM/M    day -> dd/d
/// hour -> HH/H      minute -> mm/m   second -> ss/s
class DataFormats {
  static String full = "yyyy-MM-dd HH:mm:ss";
  static String y_mo_d_h_m = "yyyy-MM-dd HH:mm";
  static String y_mo_d = "yyyy-MM-dd";
  static String y_mo = "yyyy-MM";
  static String mo_d = "MM-dd";
  static String mo_d_h_m = "MM-dd HH:mm";
  static String h_m_s = "HH:mm:ss";
  static String h_m = "HH:mm";

  static String zh_full = "yyyy年MM月dd日 HH时mm分ss秒";
  static String zh_y_mo_d_h_m = "yyyy年MM月dd日 HH时mm分";
  static String zh_y_mo_d = "yyyy年MM月dd日";
  static String zh_y_mo = "yyyy年MM月";
  static String zh_mo_d = "MM月dd日";
  static String zh_mo_d_h_m = "MM月dd日 HH时mm分";
  static String zh_h_m_s = "HH时mm分ss秒";
  static String zh_h_m = "HH时mm分";
}

/// month->days.
Map<int, int> monthDay = {
  1: 31,
  2: 28,
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31,
};

/// Date Util.
class OTDate {
  /// get DateTime By DateStr.
  static DateTime getDateTime(String dateStr, {bool isUtc = false}) {
    DateTime? dateTime = DateTime.tryParse(dateStr);
    if (dateTime != null) {
      if (isUtc) {
        dateTime = dateTime.toUtc();
      } else {
        dateTime = dateTime.toLocal();
      }
    } else {
      dateTime = DateTime(2023, 8, 8, 18, 18);
    }
    return dateTime;
  }

  /// get DateTime By Milliseconds.
  static DateTime getDateTimeByMs(int milliseconds, {bool isUtc = false}) {
    return DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
  }

  /// get DateMilliseconds By DateStr.
  static int getDateMsByTimeStr(String dateStr) {
    DateTime? dateTime = DateTime.tryParse(dateStr);
    return dateTime == null ? DateTime.now().millisecondsSinceEpoch : dateTime.millisecondsSinceEpoch;
  }

  /// get Now Date Milliseconds.
  static int getNowDateMs() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// get Now Date Str.(yyyy-MM-dd HH:mm:ss)
  static String getNowDateStr() {
    return getDateStrByDateTime(DateTime.now());
  }

  /// get DateStr By DateStr.
  /// dateStr         date String.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String getDateStrByTimeStr(
    String dateStr, {
    DateFormat format = DateFormat.normal,
    String dateSeparate = "",
    String timeSeparate = "",
    bool isUtc = false,
  }) {
    return getDateStrByDateTime(getDateTime(dateStr, isUtc: isUtc), format: format, dateSeparate: dateSeparate, timeSeparate: timeSeparate);
  }

  /// get DateStr By Milliseconds.
  /// milliseconds    milliseconds.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String getDateStrByMs(int milliseconds,
      {DateFormat format = DateFormat.normal, String dateSeparate = "", String timeSeparate = "", bool isUtc = false}) {
    DateTime dateTime = getDateTimeByMs(milliseconds, isUtc: isUtc);
    return getDateStrByDateTime(dateTime, format: format, dateSeparate: dateSeparate, timeSeparate: timeSeparate);
  }

  /// get DateStr By DateTime.
  /// dateTime        dateTime.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String getDateStrByDateTime(DateTime dateTime, {DateFormat format = DateFormat.normal, String dateSeparate = "", String timeSeparate = ""}) {
    String dateStr = dateTime.toString();
    if (isZHFormat(format)) {
      dateStr = formatZHDateTime(dateStr, format, timeSeparate);
    } else {
      dateStr = formatDateTime(dateStr, format, dateSeparate, timeSeparate);
    }
    return dateStr;
  }

  /// format ZH DateTime.
  /// time            time string.
  /// format          DateFormat type.
  ///timeSeparate    time separate.
  static String formatZHDateTime(String time, DateFormat format, String timeSeparate) {
    time = convertToZHDateTimeString(time, timeSeparate);
    switch (format) {
      case DateFormat.zhNormal: //yyyy年MM月dd日 HH时mm分ss秒
        time = time.substring(0, "yyyy年MM月dd日 HH时mm分ss秒".length - (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.zhYearMonthDayHourMinute: //yyyy年MM月dd日 HH时mm分
        time = time.substring(0, "yyyy年MM月dd日 HH时mm分".length - (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.zhYearMonthDay: //yyyy年MM月dd日
        time = time.substring(0, "yyyy年MM月dd日".length);
        break;
      case DateFormat.zhYearMonth: //yyyy年MM月
        time = time.substring(0, "yyyy年MM月".length);
        break;
      case DateFormat.zhMonthDay: //MM月dd日
        time = time.substring("yyyy年".length, "yyyy年MM月dd日".length);
        break;
      case DateFormat.zhMonthDayHourMinute: //MM月dd日 HH时mm分
        time = time.substring("yyyy年".length, "yyyy年MM月dd日 HH时mm分".length - (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.zhHourMinuteSecond: //HH时mm分ss秒
        time = time.substring("yyyy年MM月dd日 ".length, "yyyy年MM月dd日 HH时mm分ss秒".length - (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      case DateFormat.zhHourMinute: //HH时mm分
        time = time.substring("yyyy年MM月dd日 ".length, "yyyy年MM月dd日 HH时mm分".length - (timeSeparate == null || timeSeparate.isEmpty ? 0 : 1));
        break;
      default:
        break;
    }
    return time;
  }

  /// format DateTime.
  /// time            time string.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String formatDateTime(String time, DateFormat format, String dateSeparate, String timeSeparate) {
    switch (format) {
      case DateFormat.normal: //yyyy-MM-dd HH:mm:ss
        time = time.substring(0, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormat.yearMonthDayHourMinute: //yyyy-MM-dd HH:mm
        time = time.substring(0, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormat.yearMonthDay: //yyyy-MM-dd
        time = time.substring(0, "yyyy-MM-dd".length);
        break;
      case DateFormat.yearMonth: //yyyy-MM
        time = time.substring(0, "yyyy-MM".length);
        break;
      case DateFormat.monthDay: //MM-dd
        time = time.substring("yyyy-".length, "yyyy-MM-dd".length);
        break;
      case DateFormat.monthDayHourMinute: //MM-dd HH:mm
        time = time.substring("yyyy-".length, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormat.hourMinuteSecond: //HH:mm:ss
        time = time.substring("yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormat.hourMinute: //HH:mm
        time = time.substring("yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm".length);
        break;
      default:
        break;
    }
    time = dateTimeSeparate(time, dateSeparate, timeSeparate);
    return time;
  }

  /// is format to ZH DateTime String
  static bool isZHFormat(DateFormat format) {
    return format == DateFormat.zhDefaultMilli ||
        format == DateFormat.zhNormal ||
        format == DateFormat.zhYearMonthDayHourMinute ||
        format == DateFormat.zhYearMonthDay ||
        format == DateFormat.zhYearMonth ||
        format == DateFormat.zhMonthDay ||
        format == DateFormat.zhMonthDayHourMinute ||
        format == DateFormat.zhHourMinuteSecond ||
        format == DateFormat.zhHourMinute;
  }

  /// convert To ZH DateTime String
  static String convertToZHDateTimeString(String time, String timeSeparate) {
    time = time.replaceFirst("-", "年");
    time = time.replaceFirst("-", "月");
    time = time.replaceFirst(" ", "日 ");
    if (timeSeparate == null || timeSeparate.isEmpty) {
      time = time.replaceFirst(":", "时");
      time = time.replaceFirst(":", "分");
      time = time.replaceFirst(".", "秒");
      time = time + "毫秒";
    } else {
      time = time.replaceAll(":", timeSeparate);
    }
    return time;
  }

  /// date Time Separate.
  static String dateTimeSeparate(String time, String dateSeparate, String timeSeparate) {
    if (dateSeparate != null) {
      time = time.replaceAll("-", dateSeparate);
    }
    if (timeSeparate != null) {
      time = time.replaceAll(":", timeSeparate);
    }
    return time;
  }

  /// format date by milliseconds.
  /// milliseconds 日期毫秒
  static String formatDateMs(int milliseconds, {bool isUtc = false, String format = ""}) {
    return formatDate(getDateTimeByMs(milliseconds, isUtc: isUtc), format: format);
  }

  /// format date by date str.
  /// dateStr 日期字符串
  static String formatDateStr(String dateStr, {bool isUtc = false, String format = ""}) {
    return formatDate(getDateTime(dateStr, isUtc: isUtc), format: format);
  }

  /// format date by DateTime.
  /// format 转换格式(已提供常用格式 DataFormats，可以自定义格式："yyyy/MM/dd HH:mm:ss")
  /// 格式要求
  /// year -> yyyy/yy   month -> MM/M    day -> dd/d
  /// hour -> HH/H      minute -> mm/m   second -> ss/s
  static String formatDate(DateTime dateTime, {bool isUtc = false, String format = ""}) {
    if (dateTime == null) return "";
    format = format ?? DataFormats.full;
    if (format.contains("yy")) {
      String year = dateTime.year.toString();
      if (format.contains("yyyy")) {
        format = format.replaceAll("yyyy", year);
      } else {
        format = format.replaceAll("yy", year.substring(year.length - 2, year.length));
      }
    }

    format = _comFormat(dateTime.month, format, 'M', 'MM');
    format = _comFormat(dateTime.day, format, 'd', 'dd');
    format = _comFormat(dateTime.hour, format, 'H', 'HH');
    format = _comFormat(dateTime.minute, format, 'm', 'mm');
    format = _comFormat(dateTime.second, format, 's', 'ss');
    format = _comFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  /// com format.
  static String _comFormat(int value, String format, String single, String full) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format = format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }

  /// get WeekDay By Milliseconds.
  static String getWeekDayByMs(int milliseconds, {bool isUtc = false}) {
    DateTime dateTime = getDateTimeByMs(milliseconds, isUtc: isUtc);
    return getWeekDay(dateTime);
  }

  /// get ZH WeekDay By Milliseconds.
  static String getZHWeekDayByMs(int milliseconds, {bool isUtc = false}) {
    DateTime dateTime = getDateTimeByMs(milliseconds, isUtc: isUtc);
    return getZHWeekDay(dateTime);
  }

  /// get WeekDay.
  static String getWeekDay(DateTime dateTime) {
    String weekday = "";
    switch (dateTime.weekday) {
      case 1:
        weekday = "Monday";
        break;
      case 2:
        weekday = "Tuesday";
        break;
      case 3:
        weekday = "Wednesday";
        break;
      case 4:
        weekday = "Thursday";
        break;
      case 5:
        weekday = "Friday";
        break;
      case 6:
        weekday = "Saturday";
        break;
      case 7:
        weekday = "Sunday";
        break;
      default:
        break;
    }
    return weekday;
  }

  /// get ZH WeekDay.
  static String getZHWeekDay(DateTime dateTime) {
    String weekday = "";
    switch (dateTime.weekday) {
      case 1:
        weekday = "星期一";
        break;
      case 2:
        weekday = "星期二";
        break;
      case 3:
        weekday = "星期三";
        break;
      case 4:
        weekday = "星期四";
        break;
      case 5:
        weekday = "星期五";
        break;
      case 6:
        weekday = "星期六";
        break;
      case 7:
        weekday = "星期日";
        break;
      default:
        break;
    }
    return weekday;
  }

  /// Return whether it is leap year.
  static bool isLeapYearByDateTime(DateTime dateTime) {
    return isLeapYearByYear(dateTime.year);
  }

  /// Return whether it is leap year.
  static bool isLeapYearByYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }

  /// is yesterday by millis.
  /// 是否是昨天.
  static bool isYesterdayByMillis(int millis, int locMillis) {
    return isYesterday(DateTime.fromMillisecondsSinceEpoch(millis), DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// is yesterday by dateTime.
  /// 是否是昨天.
  static bool isYesterday(DateTime dateTime, DateTime locDateTime) {
    if (yearIsEqual(dateTime, locDateTime)) {
      int spDay = getDayOfYear(locDateTime) - getDayOfYear(dateTime);
      return spDay == 1;
    } else {
      return ((locDateTime.year - dateTime.year == 1) &&
          dateTime.month == 12 &&
          locDateTime.month == 1 &&
          dateTime.day == 31 &&
          locDateTime.day == 1);
    }
  }

  /// get day of year.
  /// 在今年的第几天.
  static int getDayOfYearByMillis(int millis, {bool isUtc = false}) {
    return getDayOfYear(DateTime.fromMillisecondsSinceEpoch(millis, isUtc: isUtc));
  }

  /// get day of year.
  /// 在今年的第几天.
  static int getDayOfYear(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    int days = dateTime.day;
    for (int i = 1; i < month; i++) {
      days = days + monthDay[i]!;
    }
    if (isLeapYearByYear(year) && month > 2) {
      days = days + 1;
    }
    return days;
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqualByMillis(int millis, int locMillis) {
    return yearIsEqual(DateTime.fromMillisecondsSinceEpoch(millis), DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqual(DateTime dateTime, DateTime locDateTime) {
    return dateTime.year == locDateTime.year;
  }

  /// is today.
  /// 是否是当天.
  static bool isToday(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old = DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  /// is Week.
  /// 是否是本周.
  static bool isWeek(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds <= 0) {
      return false;
    }
    DateTime _old = DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime _now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    DateTime old = _now.millisecondsSinceEpoch > _old.millisecondsSinceEpoch ? _old : _now;
    DateTime now = _now.millisecondsSinceEpoch > _old.millisecondsSinceEpoch ? _now : _old;
    return (now.weekday >= old.weekday) && (now.millisecondsSinceEpoch - old.millisecondsSinceEpoch <= 7 * 24 * 60 * 60 * 1000);
  }
}
