import 'package:banner_image/banner_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/Colors.dart';

class ImageBanner extends StatelessWidget {
  final List<String> imageUrlList;
  final double aspectRatio;

  ImageBanner({Key? key, required this.imageUrlList, this.aspectRatio = 2.0});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: BannerImage(
        itemLength: imageUrlList.length,
        imageUrlList: imageUrlList,
        selectedIndicatorColor: AppColors.Icon1Color,
        fit: BoxFit.cover,
        onTap: (int index) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('On Tap: $index'),
          ));
        },
      ),
    );
  }
}
