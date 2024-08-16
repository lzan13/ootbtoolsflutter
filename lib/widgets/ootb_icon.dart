import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

/// 圆形边框Icon
class OTIcon extends StatefulWidget {
  // Icon
  IconData? data;
  // 颜色
  Color? color;
  Color? hoverColor;

  // 背景颜色
  Color? bgColor;
  Color? hoverBGColor;
  Color? pressBGColor;
  Color? selectedBGColor;
  Color? splashBGColor;
  // 是否选中
  bool isSelected;
  // 圆角大小
  double radius;
  // 图标大小
  double size;
  // 空间
  double space;
  // 回调
  VoidCallback? onPressed;

  OTIcon({
    super.key,
    this.data,
    this.color,
    this.hoverColor = OTColors.greyBlack,
    this.bgColor,
    this.hoverBGColor = OTColors.translucent,
    this.pressBGColor = OTColors.translucent,
    this.selectedBGColor = OTColors.translucent,
    this.splashBGColor = OTColors.translucent,
    this.isSelected = false,
    this.radius = OTDimens.d8,
    this.size = OTDimens.d24,
    this.space = OTDimens.d8,
    this.onPressed,
  });

  @override
  State<OTIcon> createState() => _OTIconState();
}

class _OTIconState extends State<OTIcon> {
  // 是否悬浮
  var isHover = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.isSelected ? widget.selectedBGColor : widget.bgColor ?? OTColors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      child: InkWell(
        radius: widget.radius * 2,
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        hoverColor: widget.hoverBGColor,
        splashColor: widget.splashBGColor,
        onHover: (value) {
          setState(() => isHover = value);
        },
        onTap: widget.onPressed,
        child: Padding(
          padding: EdgeInsets.all(widget.space),
          child: widget.data == null
              ? const EmptyIcon()
              : Icon(
                  widget.data,
                  size: widget.size,
                  color: isHover ? widget.hoverColor : widget.color ?? OTTheme.theme().iconTheme.color,
                ),
        ),
      ),
    );
  }
}

/// 空图标
class EmptyIcon extends Icon {
  const EmptyIcon({super.key}) : super(Icons.hourglass_empty);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
