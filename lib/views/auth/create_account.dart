import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/drop_down.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<CreateAccountPage> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(top: 80.h),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/create_account.svg',
                    height: 67.h,
                    width: 62.w,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 50.h),
                TextFormFeild(
                  labledText: 'Your Name',
                  hintText: "Enter Your Name",
                  textInputType: TextInputType.name,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
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
                SizedBox(height: 8.h),
                TextFormFeild(
                  labledText: 'Password',
                  hintText: 'Your Password',
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Enter your password';
                    if (value.length < 6) return 'Weak password';
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                TextFormFeild(
                  labledText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Enter your password';
                    if (value != passwordController.text)
                      return 'Passwords do not match';
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showCustomSnackBar(
                        context: context,
                        message: 'Account Created Successfully',
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              VerifyCode(phone: phoneController.text),
                        ),
                      );
                    } else {
                      setState(
                        () => autovalidateMode = AutovalidateMode.always,
                      );
                    }
                  },
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                        color: const Color(0xff434C6D),
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

