import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendOtp extends StatefulWidget {
  const ResendOtp({super.key, required this.phone, required this.countryCode});
  final String phone;
  final String countryCode;

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  bool canResend = false;
  bool isLoading = false;

  Future<void> resend() async {
    setState(() => isLoading = true);
    final resp = await DioHelper.sendData(
      path: '/api/Auth/resend-otp',
      data: {"countryCode": widget.countryCode, "phoneNumber": widget.phone},
    );
    if (!mounted) return;
    setState(() => isLoading = false);
    if (resp.isSuccess) {
      showMsg('OTP has been resent successfully');
    } else {
      showMsg(resp.message ?? 'Failed to resend OTP', isError: true);
    }
  }

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
                  resend();
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
        if (isLoading)
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primaryColor,
              ),
            ),
          )
        else if (!canResend)
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
