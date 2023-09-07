import 'package:flutter/material.dart';

import 'package:vftools/themes/vfthemes.dart';

/// 自定义列表项
class VFItem extends StatefulWidget {
  // 是否是新分组的开头
  bool isNewGroup;
  // 背景色
  Color bgColor;

  // 左侧图标
  IconData? leftIcon;
  Color leftIconColor;
  // 左侧控件
  Widget? leftWidget;

  // 右侧图标
  IconData? rightIcon;
  Color rightIconColor;
  // 右侧控件
  Widget? rightWidget;

  // 标题
  String title;
  Color titleColor;
  // 描述
  String describe;
  Color describeColor;

  // 显示 divider
  bool showDivider;
  // 点击事件
  VoidCallback? onPressed;

  // 构造函数
  VFItem({
    Key? key,
    this.isNewGroup = false,
    this.bgColor = VFColors.transparent,
    this.leftIcon,
    this.leftWidget,
    this.leftIconColor = VFColors.greyBlack,
    this.rightIcon,
    this.rightIconColor = VFColors.grey,
    this.rightWidget,
    this.title = "Title",
    this.titleColor = VFColors.black,
    this.describe = "",
    this.describeColor = VFColors.grey,
    this.showDivider = true,
    this.onPressed,
  }) : super(key: key);

  @override
  VFItemState createState() => VFItemState();
}

class VFItemState extends State<VFItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.isNewGroup ? VFDimens.d16 : 0),
      color: widget.bgColor,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: widget.onPressed ?? () {},
            // padding: EdgeInsets.all(VFDimens.d0),
            child: SizedBox(
              height: VFDimens.itemLarge,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  // 左侧图标
                  widget.leftIcon != null
                      ? SizedBox(
                          height: VFDimens.itemLarge,
                          width: VFDimens.itemLarge,
                          child: Icon(
                            widget.leftIcon,
                            size: VFDimens.d24,
                            color: widget.leftIconColor,
                          ),
                        )
                      : Container(
                          width: VFDimens.marginNormal,
                        ),
                  widget.leftWidget ?? Container(),
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
                          style: TextStyle(
                            color: widget.titleColor,
                            fontSize: VFSizes.itemTitle,
                          ),
                        ),
                        // 描述
                        widget.describe == ""
                            ? const SizedBox(height: VFDimens.d0)
                            : Text(
                                widget.describe,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: widget.describeColor,
                                    fontSize: VFSizes.itemDesc),
                              ),
                      ],
                    ),
                  ),
                  // 右侧图标
                  widget.rightIcon != null
                      ? SizedBox(
                          height: VFDimens.itemNormal,
                          width: VFDimens.itemNormal,
                          child: Icon(
                            widget.rightIcon,
                            size: VFDimens.d20,
                            color: widget.rightIconColor,
                          ),
                        )
                      : Container(),
                  widget.rightWidget ?? Container(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: VFDimens.d16),
            height: widget.showDivider ? VFDimens.d05 : 0,
            color: VFColors.divider,
          )
        ],
      ),
    );
  }
}
