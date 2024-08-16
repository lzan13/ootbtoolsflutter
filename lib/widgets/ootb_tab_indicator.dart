import 'package:flutter/widgets.dart';
import 'package:ootbtoolsflutter/ootb_tools.dart';

///
/// 自定义 tab 指示器
///
class OTTabIndicator extends Decoration {
  // final BorderSide borderSide;
  final Color color;
  final Color shadowColor;
  final StrokeCap strokeCap;
  final double radius;
  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsetsGeometry insets;

  const OTTabIndicator({
    // this.borderSide = const BorderSide(width: OTDimens.d8, color: OTColors.red),
    this.color = OTColors.red,
    this.shadowColor = OTColors.red,
    this.strokeCap = StrokeCap.round,
    this.radius = OTDimens.d4,
    this.width = OTDimens.d16,
    this.height = OTDimens.d4,
    this.padding = const EdgeInsets.all(OTDimens.d8),
    this.insets = EdgeInsets.zero,
  });

  // @override
  // Decoration? lerpFrom(Decoration? a, double t) {
  //   if (a is OTTabIndicator) {
  //     return OTTabIndicator(
  //       borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
  //       insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
  //     );
  //   }
  //   return super.lerpFrom(a, t);
  // }

  // @override
  // Decoration? lerpTo(Decoration? b, double t) {
  //   if (b is OTTabIndicator) {
  //     return OTTabIndicator(
  //       borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
  //       insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
  //     );
  //   }
  //   return super.lerpTo(b, t);
  // }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    // borderSide.width = this.height;
    // 取中间坐标
    double cw = (indicator.left + indicator.right) / 2;

    // print(
    //     '$cw,indicator left${indicator.left}, right ${indicator.right}, indicator top ${indicator.top},indicator bottom${indicator.bottom}, border width${borderSide.width}');

    //这里是核心代码 //下划线靠左
    // return Rect.fromLTWH(indicator.left,
    //     indicator.bottom - borderSide.width, wantWidth, borderSide.width);

    //下划线居中
    return Rect.fromLTWH(cw - width / 2, indicator.bottom - height, width, height);
  }

//   @override
//   Path getClipPath(Rect rect, TextDirection textDirection) {
//     if (borderRadius != null) {
//       return Path()
//         ..addRRect(borderRadius!.toRRect(_indicatorRectFor(
//           rect,
//           textDirection,
//         )));
//     }
//     return Path()..addRect(_indicatorRectFor(rect, textDirection));
//   }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  final OTTabIndicator decoration;

  ///决定控制器边角形状的方法
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration._indicatorRectFor(rect, textDirection).deflate(decoration.height / 2.0);
    final Paint paint = Paint()
      ..color = decoration.color
      ..strokeWidth = decoration.height
      ..style = PaintingStyle.stroke
      ..strokeCap = decoration.strokeCap; //这块更改为想要的形状
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
