import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

enum SecretKeyStyle { upperCase, lowerCase, upperLowerCase }

/// Author: lzan13
/// Date: 2025/01/22
/// Github: https://github.com/lzan13
///
/// Desc: TOTP 基于时间的一次性密码工具类
class OTTotp {
  /// 使用Base32字母表生成密钥，适用于TOTP（基于时间的一次性密码）应用程序。
  /// [length] 要生成的密钥长度。必须在16到255之间，默认值为32。
  /// [autoPadding] 如果为true，则每4个字母创建一个分段，默认值为false。
  /// [secretKeyStyle] SecretKeyStyle用于设置密钥的大小写，默认值为upperCase。
  static String createSecret({int length = 32, bool autoPadding = false, SecretKeyStyle secretKeyStyle = SecretKeyStyle.upperCase}) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'; // Base32字母表
    if (length < 16 || length > 255) {
      throw ArgumentError('密钥长度必须在16到255之间。');
    }
    final rnd = Random.secure();
    var generatedSecret = List.generate(length, (_) => chars[rnd.nextInt(chars.length)]).join();
    generatedSecret = autoPadding ? _autoPadding(generatedSecret) : generatedSecret;

    if (secretKeyStyle == SecretKeyStyle.upperCase) {
      generatedSecret = generatedSecret.toUpperCase();
    } else if (secretKeyStyle == SecretKeyStyle.lowerCase) {
      generatedSecret = generatedSecret.toLowerCase();
    } else if (secretKeyStyle == SecretKeyStyle.upperLowerCase) {
      generatedSecret = _randomizeCase(generatedSecret);
    }
    return generatedSecret;
  }

  /// 根据提供的密钥和间隔生成TOTP验证码。
  /// [secretKey] 是字符串形式的密钥，长度限制在16到255之间。
  /// [interval] 是时间间隔（秒），建议使用30秒
  static String generateTOTPCode({required String secretKey, required int interval}) {
    if (secretKey.length < 16 || secretKey.length > 255) {
      throw ArgumentError('密钥长度必须在16到255之间。');
    }
    final time = DateTime.now().millisecondsSinceEpoch ~/ 1000 ~/ interval;
    // 移除空格和连字符
    secretKey = secretKey.replaceAll(RegExp(r'[ -]'), '');
    final secretBytes = _base32Decode(secretKey);
    final timeBytes = Uint8List(8)..buffer.asByteData().setInt64(0, time, Endian.big);
    final hmac = Hmac(sha1, secretBytes);
    final hash = hmac.convert(timeBytes).bytes;

    final offset = hash[hash.length - 1] & 0xf;
    final binary = ((hash[offset] & 0x7f) << 24) | ((hash[offset + 1] & 0xff) << 16) | ((hash[offset + 2] & 0xff) << 8) | (hash[offset + 3] & 0xff);

    final code = binary % 1000000;
    return code.toString().padLeft(6, '0');
  }

  /// 验证给定的TOTP验证码是否与密钥匹配。
  /// [secretKey] 由[createSecret]生成的密钥
  /// [totpCode] 应用程序中的TOTP验证码
  /// [interval] 时间间隔（秒），默认为30秒
  /// 如果验证码正确则返回true，否则返回false
  static bool verifyCode({required String secretKey, required String totpCode, int interval = 30}) {
    secretKey = secretKey.replaceAll(RegExp(r'[ -]'), '');
    int tolerance = 1;
    for (var i = -tolerance; i <= tolerance; i++) {
      final time = (DateTime.now().millisecondsSinceEpoch ~/ 1000 + i * interval) ~/ interval;
      final generatedCode = _generateCodeAtTime(secretKey, time);
      if (generatedCode == totpCode) return true;
    }
    return false;
  }

  /// 在特定时间生成TOTP验证码
  /// [secret] 由[createSecret]生成的密钥
  /// [time] 时间（秒）
  static String _generateCodeAtTime(String secret, int time) {
    secret = secret.replaceAll(RegExp(r'[ -]'), '');
    final timeBytes = Uint8List(8)..buffer.asByteData().setInt64(0, time, Endian.big);
    final secretBytes = _base32Decode(secret);
    final hmac = Hmac(sha1, secretBytes);
    final hash = hmac.convert(timeBytes).bytes;

    final offset = hash[hash.length - 1] & 0xf;
    final binary = ((hash[offset] & 0x7f) << 24) | ((hash[offset + 1] & 0xff) << 16) | ((hash[offset + 2] & 0xff) << 8) | (hash[offset + 3] & 0xff);

    final code = binary % 1000000;
    return code.toString().padLeft(6, '0');
  }

  /// 解码base32编码的字符串
  /// [base32] base32编码的字符串
  static List<int> _base32Decode(String base32) {
    const base32Chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
    final buffer = <int>[];
    var bits = 0;
    var value = 0;

    for (var char in base32.toUpperCase().codeUnits) {
      if (char == '='.codeUnitAt(0)) break;
      value = (value << 5) | base32Chars.indexOf(String.fromCharCode(char));
      bits += 5;

      if (bits >= 8) {
        buffer.add((value >> (bits - 8)) & 0xff);
        bits -= 8;
      }
    }
    return buffer;
  }

  /// 生成用于TOTP身份验证的QR码URL。
  /// [appName] 项目名称
  /// [secretKey] 密钥
  static String getQRCodeUrl({required String appName, required String secretKey, String? issuer = ''}) {
    return 'https://api.qrserver.com/v1/create-qr-code/?data=otpauth://totp/$appName?secret=$secretKey';
  }

  /// 每4个字符添加一个空格。
  /// [input] : 要填充的输入字符串。
  static String _autoPadding(String input) {
    // 创建一个StringBuffer来构建输出字符串
    StringBuffer output = StringBuffer();

    // 每4个字符循环一次
    for (int i = 0; i < input.length; i += 4) {
      // 检查是否至少有4个字符剩余
      if (i + 4 <= input.length) {
        // 追加接下来的4个字符
        output.write(input.substring(i, i + 4));
        // 如果这不是最后一组，则添加一个空格
        if (i + 4 < input.length) {
          output.write(' ');
        }
      }
    }
    return output.toString();
  }

  /// 随机化输入字符串的大小写。
  /// [input] 要随机化的输入字符串。
  static String _randomizeCase(String input) {
    final random = Random();
    StringBuffer randomizedString = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      if (random.nextBool()) {
        randomizedString.write(char.toUpperCase());
      } else {
        randomizedString.write(char.toLowerCase());
      }
    }

    return randomizedString.toString();
  }
}
