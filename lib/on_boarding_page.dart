import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;

  final List<String> _images = [
    'assets/png/on_boarding1.png',
    'assets/png/on_boarding2.png',
    'assets/svg/on_boarding3.svg',
  ];

  final List<bool> _isSvg = [false, false, true];

  final List<String> titles = [
    'WELCOME!',
    'SEARCH & PICK',
    'PUCH NOTIFICATIONS ',
  ];

  final List<String> _descriptions = [
    'Makeup has the power to transform your mood and empowers you to be a more confident person.',
    'We have dedicated set of products and routines hand picked for every skin type.',
    'Allow notifications for new makeup & cosmetics offers.',
  ];

  void nextPage() {
    if (currentIndex < _images.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              if (currentIndex != _images.length - 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF434C6D),
                        ),
                      ),
                    ),
                  ],
                ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isSvg[currentIndex]
                        ? SvgPicture.asset(
                            _images[currentIndex],
                            width: 300.w,
                            height: 300.h,
                          )
                        : Image.asset(
                            _images[currentIndex],
                            width: 240.w,
                            height: 240.h,
                          ),

                    SizedBox(height: 40.h),

                    Text(
                      titles[currentIndex],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF434C6D),
                        fontFamily: 'Montserrat',
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      child: Text(
                        _descriptions[currentIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF434C6D),
                          fontFamily: 'Montserrat',
                          height: 1.5,
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    currentIndex == _images.length - 1
                        ? GestureDetector(
                            onTap: nextPage,
                            child: Container(
                              width: 270.w,
                              height: 65.h,
                              margin: EdgeInsets.symmetric(horizontal: 40.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFF434C6D),
                                borderRadius: BorderRadius.circular(60.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.backGroundColor,
                                    blurRadius: 8.r,
                                    offset: Offset(0, 2.h),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Let's Start",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  letterSpacing: 1.sp,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: nextPage,
                            child: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFF434C6D),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: SvgPicture.asset(
                                'assets/svg/arrow.svg',
                                width: 8.w,
                                height: 18.h,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
