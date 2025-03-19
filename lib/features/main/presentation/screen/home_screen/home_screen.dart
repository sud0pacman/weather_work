import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/constants/asset_res.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/extentions/extentions.dart';
import 'package:weather_app/features/main/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_appbar_section.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_detail_widget.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_drawer.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_forecast_section.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_no_network.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_shimmers.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/home_weather_img_widget.dart';

import '../../../../../core/enum/locations_enum.dart';
import '../../../../../core/useful_functions/useful_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();

    _bloc.add(GetWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          Constants.logger.w(state);
        },
        builder: (context, state) {
          if (state.isNoNetwork) {
            return HomeNoNetwork(
              onTapRefresh: () {
                if (state.weatherModel != null) {
                  _bloc.add(GetWeatherEvent(locationEnum: state.locationEnum));
                } else {
                  _bloc.add(GetWeatherEvent());
                }
              },
            );
          }

          return Scaffold(
            drawer: Builder(
              builder: (innerContext) {
                return HomeDrawer(
                  onSelectedLocation: (LocationEnum locationEnum) {
                    _bloc.add(GetWeatherEvent(locationEnum: locationEnum));
                    Scaffold.of(innerContext).closeDrawer();
                  },
                );
              },
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(state.backgroundImg),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withAlpha(80),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    56.verticalSpace,
                    Builder(
                      builder: (innerContext) {
                        return HomeAppbarSection(
                          locationName:
                              state.weatherModel != null
                                  ? state.weatherModel!.location.name
                                  : "",
                          onTapDrawer: () {
                            Scaffold.of(innerContext).openDrawer();
                          },
                        );
                      },
                    ),
                    69.verticalSpace,
                    Text(
                      getFormattedDate(),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: .8,
                      ),
                    ),
                    9.verticalSpace,
                    Text(
                      "Updated as of ${state.isDataReady ? formatFullDate(state.weatherModel!.current.lastUpdated) : "..."}",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    30.verticalSpace,
                    if (state.isDataReady)
                      HomeWeatherImgWidget(
                        imgAsset:
                            state.weatherModel!.current.condition.code
                                .getCustomIcon(),
                      )
                    else
                      HomeShimmers.homeMainWeatherIcon(),
                    if (state.isDataReady == false) 6.verticalSpace,
                    if (state.isDataReady)
                      Text(
                        state.weatherModel!.current.condition.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          height: .7,
                        ),
                      )
                    else
                      HomeShimmers.homeConditionText(),
                    if (state.isDataReady == false) 12.verticalSpace,
                    if (state.isDataReady)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.weatherModel!.current.tempC
                                .toInt()
                                .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 86.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                            ),
                          ),
                          Text(
                            "ºC",
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 2.2,
                            ),
                          ),
                        ],
                      )
                    else
                      HomeShimmers.homeWeatherDegree(),
                    62.verticalSpace,
                    if (state.isDataReady)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeDetailWidget(
                            icon: AssetRes.icHumidity,
                            title: "HUMIDITY",
                            value: "${state.weatherModel!.current.humidity}%",
                          ),
                          HomeDetailWidget(
                            icon: AssetRes.icWind,
                            title: "WIND",
                            value: "${state.weatherModel!.current.windKph}km/h",
                          ),
                          HomeDetailWidget(
                            icon: AssetRes.icFeelsLike,
                            title: "FEELS LIKE",
                            value: "${state.weatherModel!.current.feelslikeC}º",
                          ),
                        ],
                      ),
                    18.verticalSpace,
                    if (state.isDataReady)
                      HomeForecastSection(
                        forecastDayList:
                            state.weatherModel!.forecast.forecastday,
                      )
                    else
                      HomeShimmers.weatherDetail(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
