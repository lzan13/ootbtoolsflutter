import 'package:flutter/material.dart';

import 'package:vftools/vftools.dart';

///
/// 自定义头像控件
///
class VFAvatar extends StatelessWidget {
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

  const VFAvatar({
    super.key,
    this.path = "",
    this.placeholder = "assets/images/img_default_avatar_female.png",
    this.isRound = true,
    this.borderColor = VFColors.white,
    this.borderWidth = VFDimens.d0,
    this.radius = VFDimens.radiusNormal,
    this.width = VFDimens.avatarNormal,
    this.height = VFDimens.avatarNormal,
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
class VFCover extends StatelessWidget {
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

  const VFCover({
    super.key,
    this.path = "",
    this.placeholder = "assets/images/img_default.png",
    this.borderColor = VFColors.white,
    this.borderWidth = VFDimens.d0,
    this.width = VFDimens.avatarNormal,
    this.height = VFDimens.avatarNormal,
    this.radius = VFDimens.radiusNormal,
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
