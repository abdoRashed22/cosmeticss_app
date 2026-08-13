//import 'package:cosmetics/views/auth/login/view.dart';
import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/helper/input_validator.dart';
import 'package:cosmetics/core/widgets/app_login_or_rigister.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/country_code.dart';
import 'package:cosmetics/views/auth/login/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// put the dtagdrop in the appInput and make a condition for appear it with bool val
class LoginView extends StatelessWidget {
  const LoginView({super.key});
  // important: here (final) help me save a one value to controller even when you createn another object of (LoginController) class
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //important: instead final controller = LoginCubit();
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          final cubitController = BlocProvider.of<LoginCubit>(context);
          //important : this line help me to get the controller from the BlocProvider and use it in the view without creating another object of (LoginController) class
          // LoginCubit controller = BlocProvider.of(context);

          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.all(14.r).copyWith(top: 48.h),
              child: Form(
                key: cubitController.formKey,
                onChanged: cubitController.onChangedFormData,

                autovalidateMode: cubitController.autovalidateMode,
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
                            cubitController.onCountryCodeChanged(code);
                          },
                        ),
                        Expanded(
                          child: TextFormFeild(
                            controller: cubitController.phoneController,
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
                      controller: cubitController.passwordController,
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
                    BlocBuilder<LoginCubit, ViewState>(
                      bloc: cubitController,
                      builder: (context, state) {
                        return CustomButton(
                          isLoading: cubitController.isLoading,
                          text: 'Login',
                          onPressed: () {
                            cubitController.onLoginButtonClicked();
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: AppLoginOrRigister(isLogin: true),
          );
        },
      ),
    );
  }
}
