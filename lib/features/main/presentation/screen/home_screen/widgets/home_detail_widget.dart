import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/constants/asset_res.dart';

class HomeDetailWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  HomeDetailWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(icon, height: 30.h, width: 30.w),

        Text(title, style: TextStyle(fontSize: 14.sp, color: Colors.white)),

        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
