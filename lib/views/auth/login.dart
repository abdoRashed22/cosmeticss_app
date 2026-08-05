import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/helper/cach.dart';
import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:cosmetics/core/helper/input_validator.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:cosmetics/core/widgets/app_login_or_rigister.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/country_code.dart';
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
  final phoneController = TextEditingController(text: "01025353411");
  final passwordController = TextEditingController(text: "123123123!");
  String selectedCountryCode = '+20';
  DataState? state;
  Future<void> sendData() async {
    state = DataState.loading;
    final resp = await DioHelper.sendData(
      path: '/api/Auth/login',
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phoneController.text.trim(),
        "password": passwordController.text.trim(),
      },
    );

    if (resp.isSuccess) {
      state = DataState.succes;
      final model = UserData.fromJson(resp.data);
      print(model.user.email);
      await Cach.saveUserData(model);
      showCustomSnackBar(context: context, message: 'Login Successful');

      Navigator.pushNamed(context, 'main');
    } else {
      state = DataState.failed;
      showCustomSnackBar(
        context: context,
        message: resp.message ?? 'Login Failed',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }

    setState(() {});
  }

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
                  AppCountryCode(
                    onCodeChanged: (code) {
                      setState(() {
                        selectedCountryCode = code;
                      });
                    },
                  ),
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
                isLoading: state == DataState.loading,
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    sendData(); // ← النجاح والـ navigate اتنقلوا لجوا sendData
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

class UserData {
  UserData({
    required this.token,
    required this.refreshToken,
    required this.user,
  });
  late final String token;
  late final String refreshToken;
  late final UserModel user;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? "";
    refreshToken = json['refreshToken'];
    user = UserModel.fromJson(json['user']);
  }
}

class UserModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;
  late final Null otpCode;
  late final Null otpExpiration;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    countryCode = json['countryCode'] ?? "";
    role = json['role'] ?? "";
    profilePhotoUrl = json['profilePhotoUrl'] ?? "";
    otpCode = null;
    otpExpiration = null;
  }
}
