import 'package:flutter/material.dart';

import 'package:vftools/constants/vfconstants.dart';

/// 自定义列表项
class VFListItem extends StatefulWidget {
  // 是否是新分组的开头
  bool isNewGroup;
  // 背景色
  Color bgColor;

  // 左侧图标
  IconData leftIcon;
  Color leftIconColor;
  // 左侧控件
  Widget leftWidget;

  // 右侧图标
  IconData rightIcon;
  Color rightIconColor;
  // 右侧控件
  Widget rightWidget;

  // 标题
  String title;
  Color titleColor;
  // 描述
  String describe;
  Color describeColor;

  // 显示 divider
  bool showDivider;
  // 点击事件
  VoidCallback onPressed;

  // 构造函数
  VFListItem({
    Key key,
    this.isNewGroup: false,
    this.bgColor,
    this.leftIcon,
    this.leftWidget,
    this.leftIconColor,
    this.rightIcon,
    this.rightIconColor: VFColors.grey,
    this.rightWidget,
    this.title,
    this.titleColor,
    this.describe,
    this.describeColor: VFColors.grey,
    this.showDivider: true,
    this.onPressed,
  }) : super(key: key);

  @override
  VFListItemState createState() => VFListItemState();
}

class VFListItemState extends State<VFListItem> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    widget.titleColor = widget.titleColor ?? themeData.textTheme.title.color;

    return Container(
      margin: EdgeInsets.only(top: widget.isNewGroup ? VFDimens.d_16 : 0),
      color: widget.bgColor,
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: widget.onPressed ?? () {},
            padding: EdgeInsets.all(VFDimens.d_0),
            child: Container(
              height: VFDimens.list_item_large,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  // 左侧图标
                  widget.leftIcon != null
                      ? Container(
                          child: SizedBox(
                            height: VFDimens.list_item_large,
                            width: VFDimens.list_item_large,
                            child: Icon(
                              widget.leftIcon,
                              size: VFDimens.d_24,
                              color:
                                  widget.leftIconColor ?? themeData.accentColor,
                            ),
                          ),
                        )
                      : Container(
                          width: VFDimens.margin_normal,
                        ),
                  widget.leftWidget == null ? Container() : widget.leftWidget,
                  // 中间内容
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 标题
                        widget.title != null
                            ? Text(
                                widget.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: widget.titleColor,
                                  fontSize: VFSizes.list_item_title,
                                ),
                              )
                            : Container(),
                        // 描述
                        widget.describe != null
                            ? Text(
                                widget.describe,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: widget.describeColor,
                                    fontSize: VFSizes.list_item_desc),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  // 右侧图标
                  widget.rightIcon != null
                      ? Container(
                          child: SizedBox(
                            height: VFDimens.list_item_normal,
                            width: VFDimens.list_item_normal,
                            child: Icon(
                              widget.rightIcon,
                              size: VFDimens.d_20,
                              color: widget.rightIconColor,
                            ),
                          ),
                        )
                      : Container(),
                  widget.rightWidget != null ? widget.rightWidget : Container(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: VFDimens.d_16),
            height: widget.showDivider ? VFDimens.d_0_5 : 0,
            color: VFColors.divider,
          )
        ],
      ),
    );
  }
}
