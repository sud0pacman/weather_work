import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbarSection extends StatelessWidget {
  String locationName;
  VoidCallback onTapDrawer;
  HomeAppbarSection({super.key, required this.locationName, required this.onTapDrawer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: Colors.white,
          size: 31,
        ),

        4.horizontalSpace,

        Text(
          locationName,
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white
          ),
        ),

        Spacer(),

        IconButton(
          onPressed: onTapDrawer,
          icon: Icon(
            Icons.menu,
            size: 32,
            color: Colors.white,
          )
        )
      ],
    );
  }
}
