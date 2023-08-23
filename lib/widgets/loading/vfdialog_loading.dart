import 'package:flutter/material.dart';

import 'package:vftools/themes/vfthemes.dart';
import 'package:vftools/widgets/loading/vfloading.dart';

///
/// 正在加载弹出框
///
class VFDialogLoading extends StatelessWidget {
  // 加载动画类型
  VFLoadingType type;
  Color color;

  VFDialogLoading({
    Key? key,
    this.color = VFColors.red87,
    this.type = VFLoadingType.circle,
  }) : super(key: key);

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
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(VFDimens.radiusNormal),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withAlpha(20),
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
