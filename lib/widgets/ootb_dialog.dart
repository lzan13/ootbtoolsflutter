import 'package:flutter/material.dart';
import 'package:ootbtoolsflutter/ootb_tools.dart';

/// 确认对话框
class OTDialog {
  /// 单例对象
  static late final OTDialog _instance = OTDialog._internal();
  // 私有构造方法
  OTDialog._internal();
  // 工厂方法，创建单例类的实例
  factory OTDialog() => _instance;

  // 确认对话框
  showAlert({
    String title = "",
    String content = "",
    String negative = "取消",
    String positive = "确认",
    VoidCallback? callback,
  }) {
    showDialog<bool>(
      context: OTools.appContext,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: OTTheme.theme().textTheme.titleMedium),
          content: Text(content, style: OTTheme.theme().textTheme.bodyLarge),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(OTDimens.radiusLarge))),
          actions: <Widget>[
            OTBtnBorder(
              title: negative,
              color: OTColors.accent87,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            OTBtnFlat(
              title: positive,
              color: OTColors.accent87,
              onPressed: () {
                Navigator.of(context).pop(true);
                callback?.call();
              },
            ),
          ],
        );
      },
    );
  }

  // 展示信息对话框
  showMsg({
    String title = "",
    String content = "",
    String positive = "我知道了",
    VoidCallback? callback,
  }) {
    showDialog<bool>(
      context: OTools.appContext,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: OTTheme.theme().textTheme.titleMedium),
          content: Text(content, style: OTTheme.theme().textTheme.bodyLarge),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(OTDimens.radiusLarge))),
          actions: <Widget>[
            OTBtnFlatBorderless(
              title: positive,
              color: OTColors.accent87,
              onPressed: () {
                callback?.call();
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  // 展示界面对话框
  showView(
    Widget child, {
    VoidCallback? callback,
  }) {
    showDialog<bool>(
      context: OTools.appContext,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(OTDimens.radiusLarge))),
          clipBehavior: Clip.antiAlias,
          child: child,
        );
      },
    );
  }
}
