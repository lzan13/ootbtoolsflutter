import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

class OTSliverDelegate extends SliverPersistentHeaderDelegate {
  // 收缩后高度
  double collapsedHeight;
  // 展开高度
  double expandedHeight;
  // 顶部距离
  double top;

  // 背景颜色
  Color bgColor;
  // 透明度
  bool hasAlpha;
  int maxAlpha;

  // 标题
  String title;
  double titleSize;
  // 居中
  bool center;
  //  标题颜色
  Color color;

  // 左侧图标
  IconData? leftIcon;
  VoidCallback? leftAction;
  Widget? leftWidget;
  // 右侧图标
  IconData? rightIcon;
  VoidCallback? rightAction;
  Widget? rightWidget;

  // 封面图
  String cover;
  // 封面控件
  Widget? coverWidget;

  OTSliverDelegate({
    Key? key,
    this.bgColor = OTColors.greyBlack,
    this.hasAlpha = true,
    this.maxAlpha = 96,
    this.title = "",
    this.titleSize = OTSizes.title,
    this.center = false,
    this.color = OTColors.white,
    this.collapsedHeight = OTDimens.d48,
    this.expandedHeight = OTDimens.d72,
    this.top = OTDimens.d8,
    this.leftIcon,
    this.leftAction,
    this.leftWidget,
    this.rightIcon,
    this.rightAction,
    this.rightWidget,
    this.cover = "",
    this.coverWidget,
  });

  @override
  double get minExtent => collapsedHeight + top;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  ///
  /// 计算滑动过程中背景色
  ///
  Color calculateBGColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, hasAlpha ? maxAlpha : 255).toInt();
    return bgColor.withAlpha(alpha);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlaps) {
    return SizedBox(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: coverWidget ?? Image.network(cover, fit: BoxFit.cover),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: calculateBGColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      leftIcon != null
                          ? SizedBox(
                              height: collapsedHeight,
                              width: collapsedHeight,
                              child: IconButton(
                                icon: Icon(
                                  leftIcon,
                                  size: OTDimens.d24,
                                  color: color,
                                ),
                                onPressed: leftAction ?? () => Navigator.pop(context),
                              ),
                            )
                          : Container(
                              width: OTDimens.marginNormal,
                            ),
                      leftWidget ?? Container(),
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: center ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                            fontSize: titleSize,
                          ),
                        ),
                      ),
                      rightWidget ?? Container(),
                      rightIcon != null
                          ? SizedBox(
                              height: collapsedHeight,
                              width: collapsedHeight,
                              child: IconButton(
                                icon: Icon(
                                  rightIcon,
                                  size: OTDimens.d24,
                                  color: color,
                                ),
                                onPressed: rightAction,
                              ),
                            )
                          : Container(
                              width: OTDimens.marginNormal,
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
