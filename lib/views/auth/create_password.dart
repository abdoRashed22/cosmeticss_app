import 'package:cosmetics/core/widgets/custom_back_button.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/views/auth/succes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key,  this.isFromForget=false});
  final bool isFromForget;

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final newPassController = TextEditingController();
  final confirmNewPassController = TextEditingController();
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
              SizedBox(height: 70.h),

              Row(children: [CustomBackButton()]),
              SizedBox(height: 50.h),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/create_account.svg',
                  height: 67.h,
                  width: 62.w,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Create Password',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'The password should have at least 6 characters',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff8E8EA9),
                ),
              ),
              SizedBox(height: 80.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormFeild(
                      controller: newPassController,
                      hintText: "Enter new password",
                      labledText: "New Password",
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter new password";
                        }
                        if (value.length < 6) {
                          return "Too short";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormFeild(
                      controller: confirmNewPassController,
                      hintText: "Confirm new password",
                      labledText: "Confirm Password",
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter confirm password";
                        }
                        if (value != newPassController.text)
                          return 'Passwords do not match';
                        if (value.length < 6) {
                          return "Too short";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 65.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Confirm',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => SuccesDialog(
      title: "Password Changed",
      message: "Your password has been changed successfully",
      textButton: 'Return to home',
      isFromForget: true,
    ),
  ),
);

                        
                      } else {
                        setState(
                          () => autovalidateMode = AutovalidateMode.always,
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
