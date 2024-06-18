import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vftools/vftools.dart';

class VFTopBar extends StatefulWidget implements PreferredSizeWidget {
  // 高度
  double height;
  // 背景
  Color bgColor;

  // 标题
  String title;

  // 居中
  bool center;
  // 隐藏
  bool isHide;

  Widget? titleWidget;

  // 左侧图标
  IconData? startIcon;
  VoidCallback? startAction;
  Widget? startWidget;

  // 右侧图标
  IconData? endIcon;
  VoidCallback? endAction;
  Widget? endWidget;

  // 底部控件
  PreferredSizeWidget? bottomWidget;

  VFTopBar({
    super.key,
    this.height = VFDimens.barNormal,
    this.bgColor = VFColors.transparent,
    this.title = "",
    this.titleWidget,
    this.center = false,
    this.isHide = false,
    this.startIcon,
    this.startAction,
    this.startWidget,
    this.endIcon,
    this.endAction,
    this.endWidget,
    this.bottomWidget,
  });

  @override
  State<StatefulWidget> createState() {
    return VFTopBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight((isHide ? 0.0 : height) + (bottomWidget?.preferredSize.height ?? 0.0));
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
                    widget.startIcon != null
                        ? Padding(
                            padding: const EdgeInsets.all(VFDimens.d4),
                            child: VFIcon(
                              data: widget.startIcon,
                              radius: VFDimens.d36,
                              onPressed: widget.startAction ??
                                  () {
                                    Navigator.canPop(context) ? Navigator.pop(context) : SystemNavigator.pop();
                                  },
                            ),
                          )
                        : SizedBox(
                            width: VFDimens.marginNormal,
                            height: widget.height,
                          ),
                    widget.startWidget ?? Container(),
                    widget.titleWidget ??
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            textAlign: widget.center ? TextAlign.center : TextAlign.start,
                            style: VFTheme.theme().textTheme.titleLarge,
                          ),
                        ),
                    widget.endWidget ?? Container(),
                    widget.endIcon != null
                        ? Padding(
                            padding: const EdgeInsets.all(VFDimens.d4),
                            child: VFIcon(
                              data: widget.endIcon,
                              radius: VFDimens.d36,
                              onPressed: widget.endAction ??
                                  () {
                                    Navigator.canPop(context) ? Navigator.pop(context) : SystemNavigator.pop();
                                  },
                            ),
                          )
                        : const SizedBox(width: VFDimens.marginSmall),
                  ],
                ),
              ),
        widget.bottomWidget ?? Container(),
      ],
    );
  }
}
