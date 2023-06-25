import 'package:flutter/material.dart';

import 'package:vftools/constants/vfconstants.dart';

///
/// 正在加载弹出框
///
class VFDialogLoading extends StatelessWidget {
  // 加载动画类型
  VFLoadingType type;
  Color color;

  VFDialogLoading({Key key, this.color, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox(
          height: VFDimens.d_96,
          width: VFDimens.d_96,
          child: Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(
                Radius.circular(VFDimens.border_radius_normal),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withAlpha(20),
                  offset: Offset(0.0, 2.0),
                  blurRadius: VFDimens.d_16,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(VFDimens.d_16),
              child: VFLoading(
                color: color,
                size: VFDimens.d_20,
                type: type,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
