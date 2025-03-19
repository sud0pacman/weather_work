import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/constants/asset_res.dart';
import 'package:weather_app/core/enum/locations_enum.dart';

class HomeDrawer extends StatelessWidget {
  Function(LocationEnum locationEnum) onSelectedLocation;
  HomeDrawer({super.key, required this.onSelectedLocation});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetRes.drawer1),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            56.verticalSpace,

            CircleAvatar(
              radius: 45.r,
              backgroundColor: Color(0xffD2982D).withValues(alpha: .30),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(AssetRes.appIcon),
              ),
            ),

            56.verticalSpace,

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, ind) {
                return drawerItem(
                  title: LocationEnum.values[ind].name.toUpperCase(),
                  onTap: () {
                    onSelectedLocation(LocationEnum.values[ind]);
                  },
                );
              },
              separatorBuilder: (ctx, ind) => 12.verticalSpace,
              itemCount: LocationEnum.values.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem({required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        height: 54,
        padding: EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Color(0xff2D3340),
          borderRadius: BorderRadius.circular(12.r),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
