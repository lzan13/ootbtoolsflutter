// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:ootbtoolsflutter/ootb_tools.dart';

import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_chasing_dots.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_circle.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_cube_grid.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_dancing_square.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_dobule_bounce.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_dual_ring.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_fading_circle.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_fading_cube.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_fading_four.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_fading_grid.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_hour_glass.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_piano_wave.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_pouring_hour_glass.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_pouring_hour_glass_refined.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_pulse.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_pulsing_grid.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_pumping_heart.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_ring.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_ripple.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_rotating_circle.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_rotating_plain.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_rotating_square.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_spinning_circle.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_spinning_lines.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_square_circle.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_three_bounce.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_three_in_out.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_wandering_cubes.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_wave_spinner.dart';
import 'package:ootbtoolsflutter/widgets/loading/ootb_loading_wave.dart';

/// Create by lzan13 2020/01/09 11:30
///
/// 简单封装圆形进度，其实就是对此项目进行了简单的包装
/// 这感谢 jogboms 的开源项目 https://github.com/jogboms/flutter_spinkit

/// 枚举加载类型
enum OTLoadingType {
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
class OTLoading extends StatelessWidget {
  // 颜色
  Color color;
  // 大小
  final double size;
  // 线条宽度
  final double borderWidth;
// 类型
  final OTLoadingType type;

  OTLoading({
    super.key,
    this.color = OTColors.red,
    this.size = OTDimens.d20,
    this.borderWidth = OTDimens.d2,
    this.type = OTLoadingType.circle,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case OTLoadingType.chasingDots:
        return OTLChasingDots(color: color, size: size);
      case OTLoadingType.circle:
        return OTLCircle(color: color, size: size);
      case OTLoadingType.cubeGrid:
        return OTLCubeGrid(color: color, size: size);
      case OTLoadingType.dancingSquare:
        return OTLDancingSquare(color: color, size: size);
      case OTLoadingType.dobuleBounce:
        return OTLDoubleBounce(color: color, size: size);
      case OTLoadingType.dualRing:
        return OTLDualRing(color: color, size: size);
      case OTLoadingType.fadingCircle:
        return OTLFadingCircle(color: color, size: size);
      case OTLoadingType.fadingCube:
        return OTLFadingCube(color: color, size: size);
      case OTLoadingType.fadingFour:
        return OTLFadingFour(color: color, size: size);
      case OTLoadingType.fadingGrid:
        return OTLFadingGrid(color: color, size: size);
      case OTLoadingType.hourGlass:
        return OTLHourGlass(color: color, size: size);
      case OTLoadingType.pianoWave:
        return OTLPianoWave(color: color, size: size);
      case OTLoadingType.pouringHourGlass:
        return OTLPouringHourGlass(color: color, size: size);
      case OTLoadingType.pouringHourGlassRefined:
        return OTLPouringHourGlassRefined(color: color, size: size);
      case OTLoadingType.pulse:
        return OTLPulse(color: color, size: size);
      case OTLoadingType.pulsingGrid:
        return OTLPulsingGrid(color: color, size: size);
      case OTLoadingType.pumpingHeart:
        return OTLPumpingHeart(color: color, size: size);
      case OTLoadingType.ring:
        return OTLRing(color: color, size: size);
      case OTLoadingType.ripple:
        return OTLRipple(color: color, size: size, borderWidth: borderWidth);
      case OTLoadingType.rotatingCircle:
        return OTLRotatingCircle(color: color, size: size);
      case OTLoadingType.rotatingPlain:
        return OTLRotatingPlain(color: color, size: size);
      case OTLoadingType.rotatingSquare:
        return OTLRotatingSquare(color: color, size: size);
      case OTLoadingType.spinningCircle:
        return OTLSpinningCircle(color: color, size: size);
      case OTLoadingType.spinningLines:
        return OTLSpinningLines(color: color, size: size);
      case OTLoadingType.squareCircle:
        return OTLSquareCircle(color: color, size: size);
      case OTLoadingType.threeBounce:
        return OTLThreeBounce(color: color, size: size);
      case OTLoadingType.threeInOut:
        return OTLThreeInOut(color: color, size: size);
      case OTLoadingType.wanderingCubes:
        return OTLWanderingCubes(color: color, size: size);
      case OTLoadingType.waveSpinner:
        return OTLWaveSpinner(color: color, size: size);
      case OTLoadingType.wave:
        return OTLWave(color: color, size: size);
      default:
        return OTLThreeBounce(color: color, size: size);
    }
  }
}
