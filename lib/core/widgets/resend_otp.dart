import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  bool canResend = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Didn’t receive a code? ",
          style: TextStyle(fontSize: 14.sp, color: Color(0xff434C6D)),
        ),

        TextButton(
          onPressed: canResend
              ? () {
                  canResend = false;
                  setState(() {});
                }
              : null,
          child: Text(
            "Resend",
            style: TextStyle(
              fontSize: 14.sp,

              color: canResend ? AppColors.primaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),
        if (!canResend)
          CircularCountDownTimer(
            isReverse: true,
            onComplete: () {
              canResend = true;
              setState(() {});
            },
            width: 50,

            height: 40,
            duration: 5,

            textFormat: CountdownTextFormat.MM_SS,
            fillColor: Colors.transparent,
            ringColor: Colors.transparent,
            textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
      ],
    );
  }
}
