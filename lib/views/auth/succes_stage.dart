import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/views/home/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccesStage extends StatefulWidget {
  const SuccesStage({super.key});
  final String title = "Account Activated!";

  @override
  State<SuccesStage> createState() => _SuccesStageState();
}

class _SuccesStageState extends State<SuccesStage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.backGroundColor,
            contentPadding: EdgeInsets.all(20.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: const BoxDecoration(
                    color: AppColors.backGroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Lottie.asset(
                    'assets/lottie/success.json',
                    height: 100.h,
                    width: 100.w,
                    repeat: false,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  "Account Activated!",
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Congratulations! Your account \nhas been successfully activated",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8E8EA9),
                  ),
                ),
                SizedBox(height: 23.h),
                CustomButton(
                  text: 'Go To Home',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainView()),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    });

    return const Scaffold(body: SizedBox());
  }
}
