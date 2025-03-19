import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/main/presentation/screen/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: false,
      designSize: MediaQuery.sizeOf(context),
      builder: (ctx, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child ?? Container(),
            );
          },
          onGenerateRoute: (settings) {
            return customRoute(HomeScreen());
          },
        );
      },
    );
  }

  static PageRouteBuilder customRoute(StatefulWidget screen) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const beginEnter = Offset(1, 0);
        const beginExit = Offset(-1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var enterTween = Tween(
          begin: beginEnter,
          end: end,
        ).chain(CurveTween(curve: curve));
        var exitTween = Tween(
          begin: end,
          end: beginExit,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(enterTween),
          child: SlideTransition(
            position: secondaryAnimation.drive(exitTween),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
    );
  }
}
