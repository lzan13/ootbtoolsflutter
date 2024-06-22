// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:vftools/vftools.dart';

import 'package:vftools/widgets/loading/vfloading_chasing_dots.dart';
import 'package:vftools/widgets/loading/vfloading_circle.dart';
import 'package:vftools/widgets/loading/vfloading_cube_grid.dart';
import 'package:vftools/widgets/loading/vfloading_dancing_square.dart';
import 'package:vftools/widgets/loading/vfloading_dobule_bounce.dart';
import 'package:vftools/widgets/loading/vfloading_dual_ring.dart';
import 'package:vftools/widgets/loading/vfloading_fading_circle.dart';
import 'package:vftools/widgets/loading/vfloading_fading_cube.dart';
import 'package:vftools/widgets/loading/vfloading_fading_four.dart';
import 'package:vftools/widgets/loading/vfloading_fading_grid.dart';
import 'package:vftools/widgets/loading/vfloading_hour_glass.dart';
import 'package:vftools/widgets/loading/vfloading_piano_wave.dart';
import 'package:vftools/widgets/loading/vfloading_pouring_hour_glass.dart';
import 'package:vftools/widgets/loading/vfloading_pouring_hour_glass_refined.dart';
import 'package:vftools/widgets/loading/vfloading_pulse.dart';
import 'package:vftools/widgets/loading/vfloading_pulsing_grid.dart';
import 'package:vftools/widgets/loading/vfloading_pumping_heart.dart';
import 'package:vftools/widgets/loading/vfloading_ring.dart';
import 'package:vftools/widgets/loading/vfloading_ripple.dart';
import 'package:vftools/widgets/loading/vfloading_rotating_circle.dart';
import 'package:vftools/widgets/loading/vfloading_rotating_plain.dart';
import 'package:vftools/widgets/loading/vfloading_rotating_square.dart';
import 'package:vftools/widgets/loading/vfloading_spinning_circle.dart';
import 'package:vftools/widgets/loading/vfloading_spinning_lines.dart';
import 'package:vftools/widgets/loading/vfloading_square_circle.dart';
import 'package:vftools/widgets/loading/vfloading_three_bounce.dart';
import 'package:vftools/widgets/loading/vfloading_three_in_out.dart';
import 'package:vftools/widgets/loading/vfloading_wandering_cubes.dart';
import 'package:vftools/widgets/loading/vfloading_wave_spinner.dart';
import 'package:vftools/widgets/loading/vfloading_wave.dart';

/// Create by lzan13 2020/01/09 11:30
///
/// 简单封装圆形进度，其实就是对此项目进行了简单的包装
/// 这感谢 jogboms 的开源项目 https://github.com/jogboms/flutter_spinkit

/// 枚举加载类型
enum VFLoadingType {
  chasingDots,
  circle,
  cubeGrid,
  dancingSquare,
  dobuleBounce,
  dualRing,
  fadingCircle,
  fadingCube,
  fadingFour,
  fadingGrid,
  hourGlass,
  pianoWave,
  pouringHourGlass,
  pouringHourGlassRefined,
  pulse,
  pulsingGrid,
  pumpingHeart,
  ring,
  ripple,
  rotatingCircle,
  rotatingPlain,
  rotatingSquare,
  spinningCircle,
  spinningLines,
  squareCircle,
  threeBounce,
  threeInOut,
  wanderingCubes,
  waveSpinner,
  wave
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
      case VFLoadingType.chasingDots:
        return VFLChasingDots(color: color, size: size);
      case VFLoadingType.circle:
        return VFLCircle(color: color, size: size);
      case VFLoadingType.cubeGrid:
        return VFLCubeGrid(color: color, size: size);
      case VFLoadingType.dancingSquare:
        return VFLDancingSquare(color: color, size: size);
      case VFLoadingType.dobuleBounce:
        return VFLDoubleBounce(color: color, size: size);
      case VFLoadingType.dualRing:
        return VFLDualRing(color: color, size: size);
      case VFLoadingType.fadingCircle:
        return VFLFadingCircle(color: color, size: size);
      case VFLoadingType.fadingCube:
        return VFLFadingCube(color: color, size: size);
      case VFLoadingType.fadingFour:
        return VFLFadingFour(color: color, size: size);
      case VFLoadingType.fadingGrid:
        return VFLFadingGrid(color: color, size: size);
      case VFLoadingType.hourGlass:
        return VFLHourGlass(color: color, size: size);
      case VFLoadingType.pianoWave:
        return VFLPianoWave(color: color, size: size);
      case VFLoadingType.pouringHourGlass:
        return VFLPouringHourGlass(color: color, size: size);
      case VFLoadingType.pouringHourGlassRefined:
        return VFLPouringHourGlassRefined(color: color, size: size);
      case VFLoadingType.pulse:
        return VFLPulse(color: color, size: size);
      case VFLoadingType.pulsingGrid:
        return VFLPulsingGrid(color: color, size: size);
      case VFLoadingType.pumpingHeart:
        return VFLPumpingHeart(color: color, size: size);
      case VFLoadingType.ring:
        return VFLRing(color: color, size: size);
      case VFLoadingType.ripple:
        return VFLRipple(color: color, size: size, borderWidth: borderWidth);
      case VFLoadingType.rotatingCircle:
        return VFLRotatingCircle(color: color, size: size);
      case VFLoadingType.rotatingPlain:
        return VFLRotatingPlain(color: color, size: size);
      case VFLoadingType.rotatingSquare:
        return VFLRotatingSquare(color: color, size: size);
      case VFLoadingType.spinningCircle:
        return VFLSpinningCircle(color: color, size: size);
      case VFLoadingType.spinningLines:
        return VFLSpinningLines(color: color, size: size);
      case VFLoadingType.squareCircle:
        return VFLSquareCircle(color: color, size: size);
      case VFLoadingType.threeBounce:
        return VFLThreeBounce(color: color, size: size);
      case VFLoadingType.threeInOut:
        return VFLThreeInOut(color: color, size: size);
      case VFLoadingType.wanderingCubes:
        return VFLWanderingCubes(color: color, size: size);
      case VFLoadingType.waveSpinner:
        return VFLWaveSpinner(color: color, size: size);
      case VFLoadingType.wave:
        return VFLWave(color: color, size: size);
      default:
        return VFLThreeBounce(color: color, size: size);
    }
  }
}
