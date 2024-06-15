// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vftools/themes/vfthemes.dart';

import 'package:vftools/widgets/loading/vfloading_circle.dart';
import 'package:vftools/widgets/loading/vfloading_cube_grid.dart';
import 'package:vftools/widgets/loading/vfloading_dobule_bounce.dart';
import 'package:vftools/widgets/loading/vfloading_fading_circle.dart';
import 'package:vftools/widgets/loading/vfloading_fading_cube.dart';
import 'package:vftools/widgets/loading/vfloading_ripple.dart';
import 'package:vftools/widgets/loading/vfloading_rotating_circle.dart';
import 'package:vftools/widgets/loading/vfloading_rotating_square.dart';
import 'package:vftools/widgets/loading/vfloading_three_bounce.dart';
import 'package:vftools/widgets/loading/vfloading_wave.dart';

///
/// Create bu lzan13 2020-01-09 11:30
///
/// 简单封装圆形进度，其实就是对此项目进行了简单的包装
///
/// 这感谢 jogboms 的开源项目 https://github.com/jogboms/flutter_spinkit
///

///
/// 枚举加载类型
///
enum VFLoadingType {
  circle,
  cubeGrid,
  dobuleBounce,
  fadingCircle,
  fadingCube,
  ripple,
  rotatingCircle,
  rotatingSquare,
  threeBounce,
  wave,
}

///
/// 简单封装圆形进度
///
class VFLoading extends StatelessWidget {
  // 颜色
  Color color;
  // 大小
  final double size;
  // 线条宽度
  final double borderWidth;
// 类型
  final VFLoadingType type;

  VFLoading({
    super.key,
    this.color = VFColors.red,
    this.size = VFDimens.d20,
    this.borderWidth = VFDimens.d2,
    this.type = VFLoadingType.wave,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case VFLoadingType.circle:
        return VFLCircle(
          color: color,
          size: size,
        );
      case VFLoadingType.cubeGrid:
        return VFLCubeGrid(
          color: color,
          size: size,
        );
      case VFLoadingType.dobuleBounce:
        return VFLDoubleBounce(
          color: color,
          size: size,
        );
      case VFLoadingType.fadingCircle:
        return VFLFadingCircle(
          color: color,
          size: size,
        );
      case VFLoadingType.fadingCube:
        return VFLFadingCube(
          color: color,
          size: size,
        );
      case VFLoadingType.ripple:
        return VFLRipple(
          color: color,
          size: size,
          borderWidth: borderWidth,
        );
      case VFLoadingType.rotatingCircle:
        return VFLRotatingCircle(
          color: color,
          size: size,
        );
      case VFLoadingType.rotatingSquare:
        return VFLRotatingSquare(
          color: color,
          size: size,
        );
      case VFLoadingType.threeBounce:
        return VFLThreeBounce(
          color: color,
          size: size,
        );
      case VFLoadingType.wave:
        return VFLWave(
          color: color,
          size: size,
        );
      default:
        return VFLThreeBounce(
          color: color,
          size: size,
        );
    }
  }
}
