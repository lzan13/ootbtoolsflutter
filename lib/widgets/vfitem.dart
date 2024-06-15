import 'package:flutter/material.dart';

import 'package:vftools/themes/vfthemes.dart';
import 'package:vftools/widgets/vficon.dart';

/// 自定义列表项
class VFItem extends StatefulWidget {
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
    super.key,
    this.isNewGroup = false,
    this.bgColor = VFColors.transparent,
    this.startIcon,
    this.startWidget,
    this.startIconColor = VFColors.greyBlack,
    this.endIcon,
    this.endIconColor = VFColors.grey,
    this.endWidget,
    this.title = "Title",
    this.titleColor = VFColors.black,
    this.describe = "",
    this.describeColor = VFColors.grey,
    this.showDivider = true,
    this.onPressed,
  });

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
            child: SizedBox(
              height: VFDimens.itemLarge,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: VFDimens.d8),
                  // 左侧图标
                  widget.startIcon != null
                      ? VFIcon(
                          data: widget.startIcon,
                          radius: VFDimens.d36,
                          size: VFDimens.d24,
                        )
                      : Container(
                          width: VFDimens.marginNormal,
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
                                style: TextStyle(color: widget.describeColor, fontSize: VFSizes.itemDesc),
                              ),
                      ],
                    ),
                  ),
                  // 右侧控件
                  widget.endWidget ?? Container(),
                  // 右侧图标
                  widget.endIcon != null
                      ? VFIcon(
                          data: widget.endIcon,
                          radius: VFDimens.d36,
                          size: VFDimens.d16,
                        )
                      : Container(),
                  const SizedBox(width: VFDimens.d8),
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
