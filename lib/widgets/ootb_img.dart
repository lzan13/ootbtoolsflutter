import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

///
/// 自定义头像控件
///
class OTAvatar extends StatelessWidget {
  // 路径
  final String path;
  final String placeholder;
  // 圆形
  final bool isRound;
  final double radius;
  // 边框
  final Color borderColor;
  final double borderWidth;
  // 宽高
  final double width;
  final double height;
  final BoxFit fit;
  // 点击回调
  final VoidCallback? onPressed;

  const OTAvatar({
    super.key,
    this.path = "",
    this.placeholder = "assets/images/img_default_avatar_female.png",
    this.isRound = true,
    this.borderColor = OTColors.white,
    this.borderWidth = OTDimens.d0,
    this.radius = OTDimens.radiusNormal,
    this.width = OTDimens.avatarNormal,
    this.height = OTDimens.avatarNormal,
    this.fit = BoxFit.cover,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final imgWidget = path.startsWith("assets/")
        ? Image.asset(
            path,
            width: width,
            height: height,
            fit: fit, // 填充方式
          )
        : FadeInImage.assetNetwork(
            placeholder: placeholder,
            image: path,
            width: width,
            height: height,
            fit: fit, // 填充方式
            imageErrorBuilder: (ctx, err, stackTrace) => Image.asset(
              placeholder, // 失败占位图
              width: width,
              height: height,
              fit: fit,
            ),
          );
    return GestureDetector(
      onTap: onPressed,
      child: isRound
          ? ClipOval(
              // 圆形
              child: imgWidget,
            )
          : ClipRRect(
              // 圆角
              borderRadius: BorderRadius.circular(radius),
              child: imgWidget,
            ),
    );
  }
}

///
/// 自定义封面控件
///
class OTCover extends StatelessWidget {
  // 路径
  final String path;
  final String placeholder;
  // 边框
  final Color borderColor;
  final double borderWidth;
  // 宽高
  final double width;
  final double height;
  // 圆角
  final double radius;
  final BorderRadius? radiusLTRB;
  final BoxFit fit;
  // 点击回调
  final VoidCallback? onPressed;

  const OTCover({
    super.key,
    this.path = "",
    this.placeholder = "assets/images/img_default.png",
    this.borderColor = OTColors.white,
    this.borderWidth = OTDimens.d0,
    this.width = OTDimens.avatarNormal,
    this.height = OTDimens.avatarNormal,
    this.radius = OTDimens.radiusNormal,
    this.radiusLTRB,
    this.fit = BoxFit.cover,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final imgWidget = path.startsWith("assets/")
        ? Image.asset(
            path,
            width: width,
            height: height,
            fit: fit, // 填充方式
          )
        : FadeInImage.assetNetwork(
            placeholder: placeholder,
            image: path,
            width: height,
            height: height,
            fit: BoxFit.cover,
            imageErrorBuilder: (ctx, err, stackTrace) => Image.asset(
              placeholder, // 失败占位图
              width: width,
              height: height,
              fit: fit,
            ),
          );
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        // 圆角
        borderRadius: radiusLTRB ?? BorderRadius.circular(radius),
        child: imgWidget,
      ),
    );
  }
}
