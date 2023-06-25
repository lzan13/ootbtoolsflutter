import 'package:flutter/material.dart';

import 'package:vftools/constants/vfconstants.dart';

class VFTopBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double top;
  final Color bgColor;

  final PreferredSizeWidget bottom;

  // 标题
  final String title;
  final double titleSize;
  final Color titleColor;
  // 居中
  final bool center;
  final Widget titleWidget;

  // 左侧图标
  final IconData leftIcon;
  final VoidCallback leftAction;
  final Widget leftWidget;

  // 右侧图标
  final IconData rightIcon;
  final VoidCallback rightAction;
  final Widget rightWidget;

  VFTopBar({
    Key key,
    this.height: VFDimens.bar_normal,
    this.top,
    this.bgColor,
    this.bottom,
    this.title,
    this.titleSize: VFSizes.title,
    this.titleColor: VFColors.greyBlack,
    this.titleWidget,
    this.center: false,
    this.leftIcon,
    this.leftAction,
    this.leftWidget,
    this.rightIcon,
    this.rightAction,
    this.rightWidget,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VFTopBarState();
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height + (bottom?.preferredSize?.height ?? 0.0));
}

///
/// 自定义标题栏
///
class VFTopBarState extends State<VFTopBar> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: widget.bgColor ?? appBarTheme.color ?? themeData.primaryColor,
          padding: EdgeInsets.only(top: widget.top),
          height: widget.height + widget.top,
          child: Row(
            children: <Widget>[
              widget.leftIcon != null
                  ? Container(
                      child: SizedBox(
                        height: widget.height,
                        width: widget.height,
                        child: IconButton(
                          icon: Icon(
                            widget.leftIcon,
                            size: VFDimens.d_24,
                            color: widget.titleColor,
                          ),
                          onPressed: widget.leftAction == null
                              ? () => Navigator.pop(context)
                              : widget.leftAction,
                        ),
                      ),
                    )
                  : Container(
                      width: VFDimens.margin_normal,
                      height: widget.height,
                    ),
              widget.leftWidget != null ? widget.leftWidget : Container(),
              widget.titleWidget == null
                  ? Expanded(
                      flex: 1,
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign:
                            widget.center ? TextAlign.center : TextAlign.start,
                        style: TextStyle(
                          color: widget.titleColor,
                          fontWeight: FontWeight.w600,
                          fontSize: widget.titleSize,
                        ),
                      ),
                    )
                  : widget.titleWidget,
              widget.rightWidget != null ? widget.rightWidget : Container(),
              widget.rightIcon != null
                  ? Container(
                      child: SizedBox(
                        height: widget.height,
                        width: widget.height,
                        child: IconButton(
                          icon: Icon(
                            widget.rightIcon,
                            size: VFDimens.d_24,
                            color: widget.titleColor,
                          ),
                          onPressed: widget.rightAction,
                        ),
                      ),
                    )
                  : Container(
                      width: VFDimens.margin_normal,
                    ),
            ],
          ),
        ),
        widget.bottom != null ? widget.bottom : Container(),
      ],
    );
  }
}
