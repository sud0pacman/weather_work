import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/constants/asset_res.dart';
import 'package:weather_app/core/useful_functions/useful_functions.dart';

import '../../../../data/model/weather_model.dart';

class HomeForecastWidget extends StatelessWidget {
  final ForecastDay day;
  HomeForecastWidget({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatDate(day.date),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xffECECEC),
          ),
        ),

        12.verticalSpace,

        Image.asset(AssetRes.icPartlyCloudy, width: 42.w, height: 32.h),

        6.verticalSpace,

        Text(
          "${day.day.tempC}º",
          style: TextStyle(
            color: Color(0xffECECEC),
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),

        6.verticalSpace,

        Text(
          "${day.day.maxWindKPH}\n km\\h",
          style: TextStyle(
            color: Color(0xffECECEC),
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
