import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/on_generate_route.dart';
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
          initialRoute: 'splash',

          theme: ThemeData(
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: AppColors.backGroundColor,

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
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide(color: Colors.grey, width: 1.w),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:  BorderSide(color: Colors.grey, width: 1.w),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.w,
                ),
              ),

              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),

          home: child,
        );
      },
    );
  }
}
