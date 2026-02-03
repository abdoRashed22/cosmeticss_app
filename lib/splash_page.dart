import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
      Navigator.pushReplacementNamed(context, 'onBoarding');
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
              duration: Duration(seconds: 2),
              child: SvgPicture.asset('assets/icons/splash.svg', width: 200.w, height: 200.h)),
            SizedBox(height: 20),

            SvgPicture.asset('assets/icons/axon.svg', width: 120.w, height: 46.h),
          ],
        ),
      ),
    );
  }
}
