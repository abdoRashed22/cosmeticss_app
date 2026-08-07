//import 'package:cosmetics/views/auth/login/view.dart';
import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/helper/input_validator.dart';
import 'package:cosmetics/core/widgets/app_login_or_rigister.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/country_code.dart';
import 'package:cosmetics/views/auth/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// put the dtagdrop in the appInput and make a condition for appear it with bool val
class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // important: here (final) help me save a one value to controller even when you createn another object of (LoginController) class
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14.r).copyWith(top: 48.h),
        child: Form(
          key: controller.formKey,
          onChanged: controller.onChangedFormData,

          autovalidateMode: controller.autovalidateMode,
          child: Column(
            children: [
              Center(
                child: AppImage(
                  image: 'login_img.png',
                  height: 300,
                  width: 250,
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                'Login Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  // color: const Color(0xff434C6D),
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
                  AppCountryCode(
                    onCodeChanged: (code) {
                      setState(() {
                        controller.selectedCountryCode = code;
                      });
                    },
                  ),
                  Expanded(
                    child: TextFormFeild(
                      controller: controller.phoneController,
                      hintText: "Enter phone number",
                      labledText: "Phone Number",
                      textInputType: TextInputType.phone,
                      obscureText: false,
                      validator: InputValidator.phoneValidator,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              TextFormFeild(
                labledText: 'Password',
                hintText: 'Your Password',
                controller: controller.passwordController,
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                isPassword: true,
                validator: InputValidator.passwordValidator,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
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
                isLoading: controller.isLoading,
                text: 'Login',
                onPressed: () {
                  controller.onLoginButtonClicked((fn) {
                    if (!mounted) return;
                    setState(fn);
                  });
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRigister(isLogin: true),
    );
  }
}
