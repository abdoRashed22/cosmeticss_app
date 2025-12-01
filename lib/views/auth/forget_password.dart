import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Center(
                child: SvgPicture.asset(
                  'assets/svg/create_account.svg',
                  height: 67.h,
                  width: 62.w,
                ),
              ),
              SizedBox(height: 45.h),
              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Please enter your phone number below \n    to recovery your password.',
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 45.h),
              Row(
                children: [
                  AppDropDown(),
                  Expanded(
                    child: TextFormFeild(
                      controller: phoneController,
                      hintText: "Enter phone number",
                      labledText: "Phone Number",
                      textInputType: TextInputType.phone,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter phone number";
                        }
                        if (value.length < 9) {
                          return "Too short";
                        }
                        if (value.length > 11) {
                          return "Invalid number";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 55.h),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.pushNamed(context, 'verifyCode');
                  } else {
                    setState(() => autovalidateMode = AutovalidateMode.always);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
