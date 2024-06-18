import 'package:flutter/material.dart';

import 'package:vftools/vftools.dart';

///
/// 正在加载弹出框
///
class VFDialogLoading extends StatelessWidget {
  // 加载动画类型
  VFLoadingType type;
  Color color;

  VFDialogLoading({
    super.key,
    this.color = VFColors.red,
    this.type = VFLoadingType.circle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox(
          height: VFDimens.d96,
          width: VFDimens.d96,
          child: Container(
            decoration: BoxDecoration(
              color: VFColors.translucent,
              borderRadius: const BorderRadius.all(
                Radius.circular(VFDimens.radiusNormal),
              ),
              boxShadow: [
                BoxShadow(
                  color: VFColors.black38,
                  offset: const Offset(0.0, 2.0),
                  blurRadius: VFDimens.d16,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(VFDimens.d16),
              child: VFLoading(
                color: color,
                size: VFDimens.d20,
                type: type,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
