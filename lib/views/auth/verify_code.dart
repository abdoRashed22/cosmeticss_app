import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:cosmetics/core/widgets/country_code.dart';
import 'package:cosmetics/core/widgets/custom_back_button.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_pin_code.dart';
import 'package:cosmetics/core/widgets/resend_otp.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/succes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VerifyCode extends StatefulWidget {
  final String phone;
  final String countryCode;
  final bool isFromForget;

  const VerifyCode({
    super.key,
    required this.phone,
    this.countryCode = '+20',
    this.isFromForget = false,
  });

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool canResend = false;
  String otpCode = '';
  ViewState? state;

  Future<void> verifyOtp() async {
    if (otpCode.length != 4) {
      showMsg('Please enter the 4-digit code', isError: true);
      return;
    }
    setState(() => state = ViewState.loading);
    final resp = await DioHelper.sendData(
      path: '/api/Auth/verify-otp',
      data: {
        "countryCode": widget.countryCode,
        "phoneNumber": widget.phone,
        "otpCode": otpCode,
      },
    );
    if (!mounted) return;
    setState(
      () => state = resp.isSuccess ? ViewState.success : ViewState.failed,
    );

    if (resp.isSuccess) {
      if (widget.isFromForget) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CreatePassword(isFromForget: true)),
        );
      } else {
        showCustomSnackBar(
          context: context,
          message: 'OTP verified successfully',
        );
        showDialog(
          context: context,
          builder: (_) => SuccesDialog(
            title: 'Congratulations',
            message: 'Your account has been created successfully',
            textButton: 'Go to Login',
            isFromForget: false,
          ),
        );
      }
    } else {
      showMsg(resp.message ?? 'Invalid code, please try again', isError: true);
    }
  }

  /* @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    canResend = false;
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
        setState(() {
          canResend = true;
        });
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),

              Row(children: [CustomBackButton()]),

              SizedBox(height: 50.h),
              SvgPicture.asset(
                'assets/icons/create_account.svg',
                height: 62.h,
                width: 67.w,
              ),
              SizedBox(height: 40.h),
              Center(
                child: Text(
                  'Verify Code',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'We just sent a 4-digit verification code to\n${widget.countryCode} ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.5,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                    TextSpan(
                      text: (widget.phone + "\t"),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff434C6D),
                      ),
                    ),
                    TextSpan(
                      text: '. Enter the code in the box \n below to continue.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.5,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Edit the number',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              CustomPinCode(onChanged: (value) => otpCode = value),
              SizedBox(height: 43.h),
              ResendOtp(phone: widget.phone, countryCode: widget.countryCode),

              /* GestureDetector(
                    onTap: canResend ? () => startTimer() : null,
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: canResend ? AppColors.primaryColor : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),*/
              /*
                  Text(
                    "0:${seconds.toString().padLeft(2, '0')}",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff434C6D)),
                  ),*/
              SizedBox(height: 120.h),
              CustomButton(
                text: 'Done',
                isLoading: state == ViewState.loading,
                onPressed: verifyOtp,
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
