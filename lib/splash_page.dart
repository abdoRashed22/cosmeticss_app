import 'package:animate_do/animate_do.dart';
import 'package:cosmetics/core/helper/cach.dart';
import 'package:cosmetics/core/helper/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (Cach.getIsFirstTime()) {
        Navigator.pushReplacementNamed(context, 'onBoarding');
      } else if (Cach.IsAuth) {
        Navigator.pushReplacementNamed(context, 'main');
      } else {
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bounce(
              duration: const Duration(seconds: 2),
              child: AppImage(image: 'splash.svg', width: 200.w, height: 200.h),
            ),
            SizedBox(height: 20.h),
            AppImage(image: 'axon.svg', width: 120.w, height: 46.h),
          ],
        ),
      ),
    );
  }
}
