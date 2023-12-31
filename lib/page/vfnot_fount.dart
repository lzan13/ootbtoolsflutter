import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vftools/generated/l10n.dart';

import 'package:vftools/widgets/vfwidgets.dart';

///
/// 空视图页面
///
class VFNotFoundPage extends StatefulWidget {
  final String pageName;

  const VFNotFoundPage(this.pageName, {super.key});

  @override
  _PageState createState() {
    return _PageState();
  }
}

class _PageState extends State<VFNotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: VFColors.white,
      body: Column(
        children: [
          TopLogoWidget(),
          Spacer(),
          BottomSignWidget(),
          Spacer(),
        ],
      ),
    );
  }
}

/// 头部内容
class TopLogoWidget extends StatelessWidget {
  const TopLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VFTopBar(
          // bgColor: VFColors.accent,
          title: I10n.of(context).pageNotFound,
          leftIcon: Icons.arrow_back_ios_rounded,
        ),
      ],
    );
  }
}

/// 底部部分
class BottomSignWidget extends StatelessWidget {
  const BottomSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Lottie.asset('assets/lotties/notFound.json'),
        // Text(
        //   I10n.of(context).pageNotFound,
        //   style: const TextStyle(fontSize: 16.0, color: Colors.grey),
        // ),
      ],
    );
  }
}
