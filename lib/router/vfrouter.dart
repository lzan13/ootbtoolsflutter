import 'package:flutter/material.dart';

import 'package:vftools/page/display/vfdisplay_page.dart';
import 'package:vftools/page/vfnot_fount.dart';

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
                VFDisplayPage(route.arguments as Map<String, String>));
      default:
        return MaterialPageRoute(
            builder: (context) => VFNotFoundPage(route.name!));
    }
  }

  /// 预览
  void toDisplayMulti(context, list, index) {
    Navigator.pushNamed(
      context,
      _displayPage,
      arguments: {
        'data': list,
        'index': index,
      },
    );
  }

  /// 测试找不到的页面跳转
  void toNotFound(context) {
    Navigator.pushNamed(context, _notFound);
  }

  /// 通用跳转
  void go(BuildContext context, String name, {params}) {
    if (params == null) {
      Navigator.pushNamed(context, name);
    } else {
      Navigator.pushNamed(context, name, arguments: params);
    }
  }
}
