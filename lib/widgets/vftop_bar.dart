import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vftools/themes/vfthemes.dart';

class VFTopBar extends StatefulWidget implements PreferredSizeWidget {
  // 高度
  double height;
  // 背景
  Color bgColor;

  // 标题
  String title;
  double titleSize;
  Color titleColor;

  // 居中
  bool center;
  // 隐藏
  bool isHide;

  Widget? titleWidget;

  // 左侧图标
  IconData? leftIcon;
  VoidCallback? leftAction;
  Widget? leftWidget;

  // 右侧图标
  IconData? rightIcon;
  VoidCallback? rightAction;
  Widget? rightWidget;

  // 底部控件
  PreferredSizeWidget? bottomWidget;

  VFTopBar({
    Key? key,
    this.height = VFDimens.barNormal,
    this.bgColor = VFColors.transparent,
    this.title = "",
    this.titleSize = VFSizes.title,
    this.titleColor = VFColors.black,
    this.titleWidget,
    this.center = false,
    this.isHide = false,
    this.leftIcon,
    this.leftAction,
    this.leftWidget,
    this.rightIcon,
    this.rightAction,
    this.rightWidget,
    this.bottomWidget,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VFTopBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(
      (isHide ? 0.0 : height) + (bottomWidget?.preferredSize.height ?? 0.0));
}

///
/// 自定义标题栏
///
class VFTopBarState extends State<VFTopBar> {
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: widget.bgColor,
          height: statusBarHeight,
        ),
        widget.isHide
            ? const SizedBox(height: VFDimens.d0)
            : Container(
                color: widget.bgColor,
                child: Row(
                  children: <Widget>[
                    widget.leftIcon != null
                        ? SizedBox(
                            width: widget.height,
                            height: widget.height,
                            child: IconButton(
                              icon: Icon(
                                widget.leftIcon,
                                size: VFDimens.d24,
                                color: widget.titleColor,
                              ),
                              onPressed: widget.leftAction ??
                                  () => {
                                        Navigator.canPop(context)
                                            ? Navigator.pop(context)
                                            : SystemNavigator.pop()
                                      },
                            ),
                          )
                        : SizedBox(
                            width: VFDimens.marginNormal,
                            height: widget.height,
                          ),
                    widget.leftWidget ?? Container(),
                    widget.titleWidget ??
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            textAlign: widget.center
                                ? TextAlign.center
                                : TextAlign.start,
                            style: TextStyle(
                              color: widget.titleColor,
                              fontWeight: FontWeight.w600,
                              fontSize: widget.titleSize,
                            ),
                          ),
                        ),
                    widget.rightWidget ?? Container(),
                    widget.rightIcon != null
                        ? SizedBox(
                            width: widget.height,
                            height: widget.height,
                            child: IconButton(
                              icon: Icon(
                                widget.rightIcon,
                                size: VFDimens.d24,
                                color: widget.titleColor,
                              ),
                              onPressed: widget.rightAction,
                            ),
                          )
                        : Container(
                            width: VFDimens.marginNormal,
                          ),
                  ],
                ),
              ),
        widget.bottomWidget ?? Container(),
      ],
    );
  }
}
