import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

/// 自定义列表项
class OTItem extends StatefulWidget {
  // 是否是新分组的开头
  bool isNewGroup;
  // 背景色
  Color bgColor;

  // 左侧图标
  IconData? startIcon;
  Color startIconColor;
  // 左侧控件
  Widget? startWidget;

  // 右侧图标
  IconData? endIcon;
  Color endIconColor;
  // 右侧控件
  Widget? endWidget;

  // 标题
  String title;
  Color? titleColor;
  // 描述
  String describe;
  Color? describeColor;

  // 显示 divider
  bool showDivider;
  // 点击事件
  VoidCallback? onPressed;

  // 构造函数
  OTItem({
    super.key,
    this.isNewGroup = false,
    this.bgColor = OTColors.transparent,
    this.startIcon,
    this.startWidget,
    this.startIconColor = OTColors.greyBlack,
    this.endIcon,
    this.endIconColor = OTColors.grey,
    this.endWidget,
    this.title = "Title",
    this.describe = "",
    this.showDivider = true,
    this.onPressed,
  });

  @override
  OTItemState createState() => OTItemState();
}

class OTItemState extends State<OTItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.isNewGroup ? OTDimens.d16 : 0),
      color: widget.bgColor,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: widget.onPressed ?? () {},
            child: SizedBox(
              height: OTDimens.itemLarge,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: OTDimens.d8),
                  // 左侧图标
                  widget.startIcon != null
                      ? OTIcon(
                          data: widget.startIcon,
                          radius: OTDimens.d36,
                          size: OTDimens.d24,
                        )
                      : Container(
                          width: OTDimens.marginNormal,
                        ),
                  widget.startWidget ?? Container(),
                  // 中间内容
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 标题
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: OTTheme.theme().textTheme.titleSmall,
                        ),
                        // 描述
                        widget.describe == ""
                            ? const SizedBox(height: OTDimens.d0)
                            : Text(
                                widget.describe,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: OTTheme.theme().textTheme.bodyMedium,
                              ),
                      ],
                    ),
                  ),
                  // 右侧控件
                  widget.endWidget ?? Container(),
                  // 右侧图标
                  widget.endIcon != null
                      ? OTIcon(
                          data: widget.endIcon,
                          radius: OTDimens.d36,
                          size: OTDimens.d16,
                        )
                      : Container(),
                  const SizedBox(width: OTDimens.d8),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: OTDimens.d16),
            height: widget.showDivider ? OTDimens.d05 : 0,
            color: OTColors.divider,
          )
        ],
      ),
    );
  }
}
