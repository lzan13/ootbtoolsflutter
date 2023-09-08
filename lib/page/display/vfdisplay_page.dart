import 'package:dio_image_provider/dio_image_provider.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:vftools/themes/vfthemes.dart';
import 'package:vftools/widgets/vfwidgets.dart';

///
/// 图片展示界面
///
class VFDisplayPage extends StatefulWidget {
  // 参数集合，因为当前页需要参数比较多，路由直接透传
  final Map<String, dynamic> params;

  List<String> imgList = [];
  int index = 0;
  PageController? controller;

  VFDisplayPage(this.params) {
    imgList = params['data'];
    index = params['index'];
    controller = PageController(initialPage: index);
  }

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<VFDisplayPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    // ADSManager.instance.showBannerADS();
    return Scaffold(
      body: Container(
        color: VFColors.black,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: VFDimens.d0,
              left: VFDimens.d0,
              bottom: VFDimens.d0,
              right: VFDimens.d0,
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  String image = widget.imgList[index];
                  return PhotoViewGalleryPageOptions(
                    imageProvider: DioImage(Uri.parse(image)),
                    heroAttributes: PhotoViewHeroAttributes(
                      tag: image,
                    ),
                  );
                },
                itemCount: widget.imgList.length,
                // loadingChild: VFLoading(),
                pageController: widget.controller,
                enableRotation: true,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              left: VFDimens.d0,
              top: VFDimens.d0,
              right: VFDimens.d0,
              child: VFTopBar(
                bgColor: VFColors.translucent,
                title: '${currentIndex + 1}/${widget.imgList.length}',
                titleColor: VFColors.white,
                leftIcon: Icons.arrow_back_ios_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
