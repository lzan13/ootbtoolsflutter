import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

///
/// 示例列表项
///
class VFExampleItem extends StatelessWidget {
  /// 方向
  final Axis direction;

  /// 宽度
  final double width;

  const VFExampleItem({
    Key? key,
    this.direction = Axis.vertical,
    this.width = double.infinity,
  }) : super(key: key);

  Widget buildVertical() {
    return Card(
      elevation: VFDimens.elevationLow,
      margin: const EdgeInsets.fromLTRB(
          VFDimens.d8, VFDimens.d0, VFDimens.d8, VFDimens.d8),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(VFDimens.d8),
              height: VFDimens.d64,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  color: VFColors.greyWhite87,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(
                      left: VFDimens.d8, right: VFDimens.d16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: VFDimens.d128,
                        height: VFDimens.d16,
                        color: VFColors.greyWhite,
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
                        width: VFDimens.d96,
                        color: VFColors.greyWhite54,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHorizontal() {
    return Card(
      elevation: VFDimens.elevationLow,
      margin: const EdgeInsets.fromLTRB(
          VFDimens.d4, VFDimens.d8, VFDimens.d4, VFDimens.d16),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: VFColors.greyWhite87,
                borderRadius: BorderRadius.only(
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
