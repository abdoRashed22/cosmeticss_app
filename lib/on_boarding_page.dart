import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final listData = [
    _model(
      image: 'on_boarding1.png',
      title: 'WELCOME!',
      desc:
          'Makeup has the power to transform your mood and empowers you to be a more confident person.',
    ),
    _model(
      image: 'on_boarding2.png',
      title: 'SEARCH & PICK',
      desc:
          'We have dedicated set of products and routines hand picked for every skin type.',
    ),
    _model(
      image: 'on_boarding3.svg',
      title: 'PUCH NOTIFICATIONS ',
      desc: 'Allow notifications for new makeup & cosmetics offers.',
    ),
  ];
  int currentIndex = 0;

  /* final List<String> _images = [
    'assets/images/on_boarding1.png',
    'assets/images/on_boarding2.png',
    'assets/icons/on_boarding3.svg',
  ];


  final List<String> titles = [
    'WELCOME!',
    'SEARCH & PICK',
    'PUCH NOTIFICATIONS ',
  ];

  final List<String> _descriptions = [
    'Makeup has the power to transform your mood and empowers you to be a more confident person.',
    'We have dedicated set of products and routines hand picked for every skin type.',
    'Allow notifications for new makeup & cosmetics offers.',
  ];*/

  void nextPage() {
    if (currentIndex < listData.length - 1) {
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
              if (currentIndex != listData.length - 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
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

                    /*  GestureDetector(
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
                    ),*/
                  ],
                ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage(
                      image: listData[currentIndex].image,
                      width: listData[currentIndex].image.endsWith('.svg')
                          ? 300.w
                          : 240.w,
                      height: listData[currentIndex].image.endsWith('.svg')
                          ? 300.h
                          : 240.h,
                    ),

                    SizedBox(height: 40.h),

                    Text(
                      listData[currentIndex].title,
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
                        //_descriptions[currentIndex],
                        listData[currentIndex].desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF434C6D),
                          height: 1.5,
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    currentIndex == listData.length - 1
                        ? CustomButton(
                            backgroundColor: Color(0xFF434C6D),
                            text: "Let's Start",
                            textStyle: TextStyle(
                              color: Colors.white,
                              backgroundColor: const Color(0xFF434C6D),
                              fontWeight: FontWeight.bold,
                           
                              fontSize: 18.sp,
                              letterSpacing: 1.sp,
                            ),

                            onPressed: nextPage,
                          )
                        /* GestureDetector(
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
                                'assets/icons/arrow.svg',
                                width: 8.w,
                                height: 18.h,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),*/
                        : FloatingActionButton(
                            onPressed: nextPage,
                            child: SvgPicture.asset(
                              'assets/icons/arrow.svg',
                              width: 8.w,
                              height: 18.h,
                              fit: BoxFit.none,
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

class _model {
  final String image, title, desc;

  _model({required this.image, required this.title, required this.desc});
}
