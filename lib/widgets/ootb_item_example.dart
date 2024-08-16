import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

///
/// 示例列表项
///
class OTItemExample extends StatelessWidget {
  /// 方向
  final Axis direction;

// 大小
  final double size;

  /// 宽度
  final double width;

  const OTItemExample({
    super.key,
    this.direction = Axis.vertical,
    this.size = OTDimens.d56,
    this.width = double.infinity,
  });

  Widget buildVertical() {
    return Card(
      elevation: OTDimens.elevationNo,
      margin: const EdgeInsets.fromLTRB(OTDimens.d8, OTDimens.d0, OTDimens.d8, OTDimens.d8),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(OTDimens.d8),
            height: size,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: const BoxDecoration(color: OTColors.greyWhite, borderRadius: BorderRadius.all(Radius.circular(OTDimens.radiusNormal))),
                // color: OTColors.greyWhite87,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(right: OTDimens.d8),
                padding: const EdgeInsets.only(left: OTDimens.d8, right: OTDimens.d8),
                decoration: const BoxDecoration(color: OTColors.white, borderRadius: BorderRadius.all(Radius.circular(OTDimens.radiusNormal))),
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: OTDimens.d8),
                    Container(
                      width: OTDimens.d128,
                      height: OTDimens.d14,
                      decoration: const BoxDecoration(color: OTColors.greyWhite, borderRadius: BorderRadius.all(Radius.circular(OTDimens.radiusLittle))),
                    ),
                    const SizedBox(height: OTDimens.d4),
                    Container(
                      height: OTDimens.d10,
                      decoration: BoxDecoration(color: OTColors.greyWhite54, borderRadius: const BorderRadius.all(Radius.circular(OTDimens.radiusLittle))),
                    ),
                    const SizedBox(height: OTDimens.d2),
                    Container(
                      height: OTDimens.d10,
                      width: OTDimens.d96,
                      decoration: BoxDecoration(color: OTColors.greyWhite54, borderRadius: const BorderRadius.all(Radius.circular(OTDimens.radiusLittle))),
                    ),
                    const SizedBox(height: OTDimens.d8),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontal() {
    return Card(
      elevation: OTDimens.elevationLow,
      margin: const EdgeInsets.fromLTRB(OTDimens.d4, OTDimens.d8, OTDimens.d4, OTDimens.d16),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: OTColors.greyWhite87,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(OTDimens.radiusNormal),
                  topRight: Radius.circular(OTDimens.radiusNormal),
                ),
              ),
              height: OTDimens.d96,
              width: width,
            ),
            Container(
              width: width,
              padding: const EdgeInsets.all(OTDimens.d8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: OTDimens.d96,
                    height: OTDimens.d16,
                    color: OTColors.greyWhite,
                  ),
                  Container(
                    width: OTDimens.d64,
                    height: OTDimens.d10,
                    margin: const EdgeInsets.only(top: OTDimens.d8),
                    color: OTColors.greyWhite54,
                  ),
                  const SizedBox(
                    height: OTDimens.d8,
                  ),
                  Container(
                    height: OTDimens.d10,
                    color: OTColors.greyWhite54,
                  ),
                  const SizedBox(
                    height: OTDimens.d4,
                  ),
                  Container(
                    height: OTDimens.d10,
                    color: OTColors.greyWhite54,
                  ),
                  const SizedBox(
                    height: OTDimens.d4,
                  ),
                  Container(
                    height: OTDimens.d10,
                    width: OTDimens.d96,
                    color: OTColors.greyWhite54,
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
