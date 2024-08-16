import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

///
/// 正在加载弹出框
///
class OTDialogLoading extends StatelessWidget {
  // 加载动画类型
  OTLoadingType type;
  Color color;

  OTDialogLoading({
    super.key,
    this.color = OTColors.red,
    this.type = OTLoadingType.circle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox(
          height: OTDimens.d96,
          width: OTDimens.d96,
          child: Container(
            decoration: BoxDecoration(
              color: OTColors.translucent,
              borderRadius: const BorderRadius.all(
                Radius.circular(OTDimens.radiusNormal),
              ),
              boxShadow: [
                BoxShadow(
                  color: OTColors.black38,
                  offset: const Offset(0.0, 2.0),
                  blurRadius: OTDimens.d16,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(OTDimens.d16),
              child: OTLoading(
                color: color,
                size: OTDimens.d20,
                type: type,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
