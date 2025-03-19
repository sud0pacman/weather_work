import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/common/shape.dart';

class HomeShimmers {
  static Widget homeMainWeatherIcon() {
    return shimmerContainer(95.h, 95.w);
  }

  static Widget homeConditionText() {
   return textShimmer("Sunny", style: TextStyle(
       color: Colors.white,
       fontSize: 40.sp,
       fontWeight: FontWeight.bold,
   ));
  }

  static Widget homeWeatherDegree() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textShimmer(
          "16",
          style: TextStyle(
              color: Colors.white,
              fontSize: 86.sp,
              fontWeight: FontWeight.w500,
              height: 1.3
          ),
        ),

        textShimmer(
          "ºC",
          style: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 2.2
          ),
        )
      ],
    );
  }

  static Widget weatherDetail(BuildContext context) {
    return shimmerContainer(160.h, MediaQuery.of(context).size.width * .75,);
  }

  static Widget textShimmer(String text, {required TextStyle style}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.white.withAlpha(160),
      child: Text(
        text,
        style: style,
      ),
    );
  }
  
  static Widget shimmerContainer(double width, double height, {double radius = 25}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey,
      child: AppGenericShape(
        cornerRadius: radius.r,
        child: Container(
          height: width,
          width: height,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(160),
          ),
        ),
      ),
    );
  }
}