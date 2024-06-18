import 'package:flutter/material.dart';

import 'package:vftools/vftools.dart';

/// 圆形边框Icon
class VFIcon extends StatefulWidget {
  // Icon
  IconData? data;
  // 颜色
  Color? color;
  Color? hoverColor;

  // 背景颜色
  Color? bgColor;
  Color? hoverBGColor;
  Color? pressBGColor;
  Color? splashBGColor;
  // 圆角大小
  double radius;
  // 图标大小
  double size;
  // 空间
  double space;
  // 回调
  VoidCallback? onPressed;

  VFIcon({
    super.key,
    this.data,
    this.color,
    this.hoverColor = VFColors.greyBlack,
    this.bgColor,
    this.hoverBGColor = VFColors.translucent,
    this.pressBGColor = VFColors.translucent,
    this.splashBGColor = VFColors.translucent,
    this.radius = VFDimens.d8,
    this.size = VFDimens.d24,
    this.space = VFDimens.d8,
    this.onPressed,
  });

  @override
  State<VFIcon> createState() => _VFIconState();
}

class _VFIconState extends State<VFIcon> {
  // 是否悬浮
  var isHover = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.bgColor ?? VFColors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      child: InkWell(
        radius: widget.radius * 2,
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        hoverColor: widget.hoverBGColor,
        splashColor: widget.splashBGColor,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(widget.space),
          child: widget.data == null
              ? const EmptyIcon()
              : Icon(
                  widget.data,
                  size: widget.size,
                  color: isHover ? widget.hoverColor : widget.color ?? VFTheme.theme().iconTheme.color,
                ),
        ),
        onTap: () {
          widget.onPressed?.call();
        },
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
