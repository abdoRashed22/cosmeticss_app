import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/on_generate_route.dart';
import 'package:cosmetics/splash_page.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.routes,

          // initialRoute: 'splash',
          theme: ThemeData(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xFF434C6D),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                // for hright only and make a width responsible foe text
                fixedSize: Size.fromHeight(65),
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Color(0xff434C6D), fontSize: 16),
            ),
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: AppColors.backGroundColor,
            cardColor: Color(0xffD9D9D9),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
            ),

            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0xffF5F5F5),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 12,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Color(0xff5A6690).withValues(alpha: .4),
                  width: 1.w,
                ),
              ),

              labelStyle: const TextStyle(color: Colors.grey),
              floatingLabelStyle: TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),

          home: SplashPage(),
        );
      },
    );
  }
}
