import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:cosmetics/core/widgets/drop_down.dart';
import 'package:flutter/material.dart';

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
  //ask for duspose and init state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.only(top: 60),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'assets/png/login_img.png',
                    height: 300,
                    width: 250,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Login Now',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Please enter the details below to continue',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff8E8EA9),
                  ),
                ),
                const SizedBox(height: 25),
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
                const SizedBox(height: 8),
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
                const SizedBox(height: 8),
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(color: Color(0xff434C6D)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'createAccount');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12,
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
