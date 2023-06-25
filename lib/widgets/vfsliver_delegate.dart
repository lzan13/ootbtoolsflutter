import 'package:flutter/material.dart';

import 'package:vftools/constants/vfconstants.dart';

class VFSliverDelegate extends SliverPersistentHeaderDelegate {
  // 收缩后高度
  final double collapsedHeight;
  // 展开高度
  final double expandedHeight;
  // 顶部距离
  final double top;

  // 背景颜色
  final Color bgColor;
  // 透明度
  final bool hasAlpha;
  final int maxAlpha;

  // 标题
  final String title;
  final double titleSize;
  // 居中
  final bool center;
  //  标题颜色
  final Color color;

  // 左侧图标
  final IconData leftIcon;
  final VoidCallback leftAction;
  final Widget leftWidget;
  // 右侧图标
  final IconData rightIcon;
  final VoidCallback rightAction;
  final Widget rightWidget;

  // 封面图
  final String cover;
  // 封面控件
  final Widget coverWidget;

  VFSliverDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.top,
    this.bgColor: VFColors.greyBlack,
    this.hasAlpha: true,
    this.maxAlpha: 96,
    this.title,
    this.titleSize = VFSizes.title,
    this.center = false,
    this.color: VFColors.white,
    this.leftIcon,
    this.leftAction,
    this.leftWidget,
    this.rightIcon,
    this.rightAction,
    this.rightWidget,
    this.cover,
    this.coverWidget,
  });

  @override
  double get minExtent => this.collapsedHeight + this.top;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  ///
  /// 计算滑动过程中背景色
  ///
  Color calculateBGColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, hasAlpha ? maxAlpha : 255)
        .toInt();
    return bgColor.withAlpha(alpha);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlaps) {
    return Container(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: coverWidget == null
                ? Image.network(cover, fit: BoxFit.cover)
                : coverWidget,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: calculateBGColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      leftIcon != null
                          ? Container(
                              child: SizedBox(
                                height: collapsedHeight,
                                width: collapsedHeight,
                                child: IconButton(
                                  icon: Icon(
                                    leftIcon,
                                    size: VFDimens.d_24,
                                    color: color,
                                  ),
                                  onPressed: leftAction == null
                                      ? () => Navigator.pop(context)
                                      : leftAction,
                                ),
                              ),
                            )
                          : Container(
                              width: VFDimens.margin_normal,
                            ),
                      leftWidget != null ? leftWidget : Container(),
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          textAlign:
                              center ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                            fontSize: titleSize,
                          ),
                        ),
                      ),
                      rightWidget != null ? rightWidget : Container(),
                      rightIcon != null
                          ? Container(
                              child: SizedBox(
                                height: collapsedHeight,
                                width: collapsedHeight,
                                child: IconButton(
                                  icon: Icon(
                                    rightIcon,
                                    size: VFDimens.d_24,
                                    color: color,
                                  ),
                                  onPressed: rightAction,
                                ),
                              ),
                            )
                          : Container(
                              width: VFDimens.margin_normal,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
