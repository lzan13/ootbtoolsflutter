import 'package:flutter/material.dart';
import 'package:vftools/vftools.dart';

/// 确认对话框
class VFDialog {
  /// 单例对象
  static late final VFDialog _instance = VFDialog._internal();
  // 私有构造方法
  VFDialog._internal();
  // 工厂方法，创建单例类的实例
  factory VFDialog() => _instance;

  // 确认对话框
  alert({
    String title = "",
    String content = "",
    String negative = "取消",
    String positive = "确认",
    VoidCallback? callback,
  }) {
    showDialog<bool>(
      context: VFTools().appContext!,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: VFStyles.appTextTitle),
          content: Text(content, style: VFStyles.appTextBody),
          actions: <Widget>[
            VFBtnBorder(
              title: negative,
              color: VFColors.accent87,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            VFBtnFlat(
              title: positive,
              color: VFColors.accent87,
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

  // 展示信息对话框
  showMsg({
    String title = "",
    String content = "",
    String btn = "我知道了",
    VoidCallback? callback,
  }) {
    showDialog<bool>(
      context: VFTools().appContext!,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: VFStyles.appTextTitle),
          content: Text(content),
          actions: <Widget>[
            VFBtnFlatBorderless(
              title: btn,
              color: VFColors.accent87,
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
}

// 展示界面对话框
showView(
  Widget child, {
  VoidCallback? callback,
}) {
  showDialog<bool>(
    context: VFTools().appContext!,
    builder: (context) {
      return Dialog(
        child: child,
      );
    },
  );
}
