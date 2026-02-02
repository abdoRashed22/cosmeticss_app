import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoginOrRigister extends StatelessWidget {
  const AppLoginOrRigister({super.key, required this.isLogin});
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: isLogin ? 'Don’t have an account?' : 'Have an account?',
              style: TextStyle(color: const Color(0xff434C6D), fontSize: 14.sp),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  if (isLogin) {
                    Navigator.pushNamed(context, 'createAccount');
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  isLogin ? 'Register' : 'Login',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      /*Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don’t have an account?",
            style: TextStyle(color: const Color(0xff434C6D), fontSize: 14.sp),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'createAccount');
            },
            child: Text(
              'Register',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),*/
    );
  }
}
