import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_forecast_widget.dart';

import '../../../../data/model/weather_model.dart';

class HomeForecastSection extends StatelessWidget {
  final List<ForecastDay> forecastDayList;
  HomeForecastSection({super.key, required this.forecastDayList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff535353).withValues(alpha: .70),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, ind) {
          return HomeForecastWidget(day: forecastDayList[ind]);
        },
        separatorBuilder: (ctx, ind) => 40.horizontalSpace,
        itemCount: forecastDayList.length,
      ),
    );
  }
}
