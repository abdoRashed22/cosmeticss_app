import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/helper/input_validator.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:cosmetics/core/widgets/app_login_or_rigister.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// put the dtagdrop in the appInput and make a condition for appear it with bool val
class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14.r).copyWith(top: 48.h),
        child: Form(
          key: formKey,
          /*   onChanged: () {
            formKey.currentState!.validate();
          }, */
          autovalidateMode: autovalidateMode,
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
                  AppDropDown(),
                  Expanded(
                    child: TextFormFeild(
                      controller: phoneController,
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
                controller: passwordController,
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
              //  isLoading: true,
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.pushNamed(context, 'main');

                    showCustomSnackBar(
                      context: context,
                      message: 'Login Successful',
                    );
                  } else {
                    setState(() => autovalidateMode = AutovalidateMode.always);
                  }
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
