import 'package:flutter/material.dart';
import 'package:vftools/constants/vfconstants.dart';

///
/// 示例列表项
///
class VFExampleItem extends StatelessWidget {
  /// 方向
  final Axis direction;

  /// 宽度
  final double width;

  const VFExampleItem({
    Key key,
    this.direction = Axis.vertical,
    this.width = double.infinity,
  }) : super(key: key);

  Widget buildVertical() {
    return Card(
      elevation: VFDimens.elevation_low,
      margin: EdgeInsets.fromLTRB(
          VFDimens.d_8, VFDimens.d_0, VFDimens.d_8, VFDimens.d_8),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(VFDimens.d_8),
              height: VFDimens.d_64,
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
                  padding:
                      EdgeInsets.only(left: VFDimens.d_8, right: VFDimens.d_16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: VFDimens.d_128,
                        height: VFDimens.d_16,
                        color: VFColors.greyWhite,
                      ),
                      SizedBox(
                        height: VFDimens.d_8,
                      ),
                      Container(
                        height: VFDimens.d_10,
                        color: VFColors.greyWhite54,
                      ),
                      SizedBox(
                        height: VFDimens.d_4,
                      ),
                      Container(
                        height: VFDimens.d_10,
                        width: VFDimens.d_96,
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
      elevation: VFDimens.elevation_low,
      margin: EdgeInsets.fromLTRB(
          VFDimens.d_4, VFDimens.d_8, VFDimens.d_4, VFDimens.d_16),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: VFColors.greyWhite87,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(VFDimens.border_radius_normal),
                  topRight: Radius.circular(VFDimens.border_radius_normal),
                ),
              ),
              height: VFDimens.d_96,
              width: width,
            ),
            Container(
              width: width,
              padding: EdgeInsets.all(VFDimens.d_8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: VFDimens.d_96,
                    height: VFDimens.d_16,
                    color: VFColors.greyWhite,
                  ),
                  Container(
                    width: VFDimens.d_64,
                    height: VFDimens.d_10,
                    margin: EdgeInsets.only(top: VFDimens.d_8),
                    color: VFColors.greyWhite54,
                  ),
                  SizedBox(
                    height: VFDimens.d_8,
                  ),
                  Container(
                    height: VFDimens.d_10,
                    color: VFColors.greyWhite54,
                  ),
                  SizedBox(
                    height: VFDimens.d_4,
                  ),
                  Container(
                    height: VFDimens.d_10,
                    color: VFColors.greyWhite54,
                  ),
                  SizedBox(
                    height: VFDimens.d_4,
                  ),
                  Container(
                    height: VFDimens.d_10,
                    width: VFDimens.d_96,
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
