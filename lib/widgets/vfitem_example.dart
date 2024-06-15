import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

///
/// 示例列表项
///
class VFItemExample extends StatelessWidget {
  /// 方向
  final Axis direction;

// 大小
  final double size;

  /// 宽度
  final double width;

  const VFItemExample({
    super.key,
    this.direction = Axis.vertical,
    this.size = VFDimens.d56,
    this.width = double.infinity,
  });

  Widget buildVertical() {
    return Card(
      elevation: VFDimens.elevationNo,
      margin: const EdgeInsets.fromLTRB(VFDimens.d8, VFDimens.d0, VFDimens.d8, VFDimens.d8),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(VFDimens.d8),
            height: size,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: const BoxDecoration(color: VFColors.greyWhite, borderRadius: BorderRadius.all(Radius.circular(VFDimens.radiusNormal))),
                // color: VFColors.greyWhite87,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(right: VFDimens.d8),
                padding: const EdgeInsets.only(left: VFDimens.d8, right: VFDimens.d8),
                decoration: const BoxDecoration(color: VFColors.white, borderRadius: BorderRadius.all(Radius.circular(VFDimens.radiusNormal))),
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: VFDimens.d8),
                    Container(
                      width: VFDimens.d128,
                      height: VFDimens.d14,
                      decoration: const BoxDecoration(color: VFColors.greyWhite, borderRadius: BorderRadius.all(Radius.circular(VFDimens.radiusLittle))),
                    ),
                    const SizedBox(height: VFDimens.d4),
                    Container(
                      height: VFDimens.d10,
                      decoration: BoxDecoration(color: VFColors.greyWhite54, borderRadius: const BorderRadius.all(Radius.circular(VFDimens.radiusLittle))),
                    ),
                    const SizedBox(height: VFDimens.d2),
                    Container(
                      height: VFDimens.d10,
                      width: VFDimens.d96,
                      decoration: BoxDecoration(color: VFColors.greyWhite54, borderRadius: const BorderRadius.all(Radius.circular(VFDimens.radiusLittle))),
                    ),
                    const SizedBox(height: VFDimens.d8),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontal() {
    return Card(
      elevation: VFDimens.elevationLow,
      margin: const EdgeInsets.fromLTRB(VFDimens.d4, VFDimens.d8, VFDimens.d4, VFDimens.d16),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: VFColors.greyWhite87,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(VFDimens.radiusNormal),
                  topRight: Radius.circular(VFDimens.radiusNormal),
                ),
              ),
              height: VFDimens.d96,
              width: width,
            ),
            Container(
              width: width,
              padding: const EdgeInsets.all(VFDimens.d8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: VFDimens.d96,
                    height: VFDimens.d16,
                    color: VFColors.greyWhite,
                  ),
                  Container(
                    width: VFDimens.d64,
                    height: VFDimens.d10,
                    margin: const EdgeInsets.only(top: VFDimens.d8),
                    color: VFColors.greyWhite54,
                  ),
                  const SizedBox(
                    height: VFDimens.d8,
                  ),
                  Container(
                    height: VFDimens.d10,
                    color: VFColors.greyWhite54,
                  ),
                  const SizedBox(
                    height: VFDimens.d4,
                  ),
                  Container(
                    height: VFDimens.d10,
                    color: VFColors.greyWhite54,
                  ),
                  const SizedBox(
                    height: VFDimens.d4,
                  ),
                  Container(
                    height: VFDimens.d10,
                    width: VFDimens.d96,
                    color: VFColors.greyWhite54,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return direction == Axis.vertical ? buildVertical() : buildHorizontal();
  }
}
