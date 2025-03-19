import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/constants/asset_res.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/widgets/refresh_button.dart';

class HomeNoNetwork extends StatelessWidget {
  final VoidCallback onTapRefresh;
  HomeNoNetwork({super.key, required this.onTapRefresh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetRes.background1),
            fit: BoxFit.cover,
          ),
          boxShadow: [BoxShadow(color: Colors.black87)],
        ),
        alignment: Alignment(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 300.h,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  color: Colors.white.withValues(
                    alpha: 0.2,
                  ), // Semi-transparent
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AssetRes.icWarning, width: 56, height: 56),

                      24.verticalSpace,

                      Text(
                        'Go connect to internet end refresh the page :))',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            32.verticalSpace,

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                child: Container(
                  width: 60.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                      alpha: 0.2,
                    ), // Semi-transparent
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  alignment: Alignment.center,
                  child: RefreshButton(
                    onTap: () {
                      Constants.logger.i("on tap refresh out");
                      onTapRefresh();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlurryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image or Color

        // Blurred Overlay
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: Container(
                width: 200,
                height: 100,
                color: Colors.white.withOpacity(0.2), // Semi-transparent
                alignment: Alignment.center,
                child: Text(
                  'Blurry Widget',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(home: BlurryWidget()));
}
