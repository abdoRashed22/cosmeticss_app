import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(top: 60.h),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/png/login_img.png',
                    height: 300.h,
                    width: 250.w,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  'Login Now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff434C6D),
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Please enter the details below to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff8E8EA9),
                  ),
                ),
                SizedBox(height: 25.h),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'forgetPassword');
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.pushNamed(context, 'home');

                      showCustomSnackBar(
                        context: context,
                        message: 'Login Successful',
                      );
                    } else {
                      setState(
                        () => autovalidateMode = AutovalidateMode.always,
                      );
                    }
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: const Color(0xff434C6D),
                        fontSize: 14.sp,
                      ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
