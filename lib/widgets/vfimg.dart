import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

///
/// 自定义头像控件
///
class VFImgAvatar extends StatelessWidget {
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
  // 点击回调
  final VoidCallback? onPressed;

  const VFImgAvatar({
    Key? key,
    this.path = "",
    this.placeholder = "assets/images/img_default_avatar.png",
    this.isRound = true,
    this.borderColor = VFColors.white,
    this.borderWidth = VFDimens.d0,
    this.radius = VFDimens.radiusNormal,
    this.width = VFDimens.avatarNormal,
    this.height = VFDimens.avatarNormal,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgWidget = FadeInImage.assetNetwork(
      placeholder: placeholder,
      image: path,
      width: width,
      height: height,
      fit: BoxFit.cover, // 头像充满
      imageErrorBuilder: (ctx, err, stackTrace) => Image.asset(
        placeholder, // 失败占位图
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
    return InkWell(
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
class VFImgCover extends StatelessWidget {
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
  // 点击回调
  final VoidCallback? onPressed;

  const VFImgCover({
    Key? key,
    this.path = "",
    this.placeholder = "assets/images/img_default.png",
    this.borderColor = VFColors.white,
    this.borderWidth = VFDimens.d0,
    this.width = VFDimens.avatarNormal,
    this.height = VFDimens.avatarNormal,
    this.radius = VFDimens.radiusNormal,
    this.radiusLTRB,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgWidget = FadeInImage.assetNetwork(
      placeholder: placeholder,
      image: path,
      width: height,
      height: height,
      fit: BoxFit.cover,
      imageErrorBuilder: (ctx, err, stackTrace) => Image.asset(
        placeholder, // 失败占位图
        width: width,
        height: height,
        fit: BoxFit.cover,
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
