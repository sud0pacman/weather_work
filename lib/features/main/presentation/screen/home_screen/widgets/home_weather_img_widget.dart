import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWeatherImgWidget extends StatelessWidget {
  String imgAsset;
  HomeWeatherImgWidget({super.key, required this.imgAsset});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgAsset,
      width: 95.w,
      height: 95.h
    );
  }
}
