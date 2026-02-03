import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      backgroundColor: AppColors.backGroundColor,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      cursorColor: Color(0x10101038),
      cursorHeight: 16.h,
      cursorWidth: 5.w,
      hintCharacter: "_",
      appContext: context,
      length: 4,
      obscureText: false,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        fieldHeight: 50.h,
        fieldWidth: 50.w,

        activeColor: AppColors.primaryColor,
        inactiveColor: Color(0xff898992),
        selectedColor: AppColors.primaryColor,
        activeFillColor: AppColors.backGroundColor,
        inactiveFillColor: AppColors.backGroundColor,
        selectedFillColor: AppColors.backGroundColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onChanged: (value) {},
    );
  }
}
