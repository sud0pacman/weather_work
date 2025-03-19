import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/constants/asset_res.dart';
import 'package:weather_app/core/constants/constants.dart';

class RefreshButton extends StatefulWidget {
  final VoidCallback onTap;

  const RefreshButton({super.key, required this.onTap});

  @override
  _RefreshButtonState createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  void _rotate() {
    Constants.logger.i("on Tap button in");
    widget.onTap();
    if (_controller.isAnimating) return;

    _controller.forward(from: 0.0).then((_) {
      _controller.reset();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rotate,
      child: RotationTransition(
        turns: _controller,
        child: Image.asset(
          AssetRes.icRefresh,
          color: Colors.white,
          width: 50.w,
          height: 50.h,
        ),
      ),
    );
  }
}
