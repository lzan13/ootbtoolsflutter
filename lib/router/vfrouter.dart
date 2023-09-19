import 'package:flutter/material.dart';

import 'package:vftools/page/display/vfdisplay_page.dart';
import 'package:vftools/page/vfnot_fount.dart';
import 'package:vftools/vftools.dart';

/*
 * 路由器
 */
class VFRouter {
  static const String _displayPage = 'displayPage'; // 展示界面
  static const String _notFound = 'notFound'; // 错误页面

  ///
  /// 生成路由
  ///
  Route<dynamic> generateRoute(RouteSettings route) {
    switch (route.name) {
      case _displayPage:
        return MaterialPageRoute(
            builder: (context) =>
                VFDisplayPage(route.arguments as Map<String, dynamic>));
      default:
        return MaterialPageRoute(
            builder: (context) => VFNotFoundPage(route.name!));
    }
  }

  /// 预览
  void toDisplayMulti(List<String> list, int index) {
    Navigator.pushNamed(
      VFTools().appContext!,
      _displayPage,
      arguments: {
        'data': list,
        'index': index,
      },
    );
  }

  /// 测试找不到的页面跳转
  void toNotFound() {
    Navigator.pushNamed(VFTools().appContext!, _notFound);
  }

  /// 通用跳转
  void go(String name, {params}) {
    if (params == null) {
      Navigator.pushNamed(VFTools().appContext!, name);
    } else {
      Navigator.pushNamed(VFTools().appContext!, name, arguments: params);
    }
  }
}
