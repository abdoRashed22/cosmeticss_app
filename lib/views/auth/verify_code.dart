import 'dart:async';
import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:cosmetics/views/auth/succes_stage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCode extends StatefulWidget {
  final String phone;

  const VerifyCode({super.key, required this.phone});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  int seconds = 60;
  Timer? timer;
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    canResend = false;
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
        setState(() {
          canResend = true;
        });
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              SvgPicture.asset(
                'assets/svg/create_account.svg',
                height: 62,
                width: 67,
              ),
              const SizedBox(height: 40),

              Center(
                child: Text(
                  'Verify Code',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'We just sent a 4-digit verification code to\n+20 ',
                      style: TextStyle(fontSize: 14, color: Color(0xff8E8EA9)),
                    ),
                    TextSpan(
                      text: widget.phone,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff434C6D),
                      ),
                    ),
                    const TextSpan(
                      text: '. Enter the code in the box below to continue.',
                      style: TextStyle(fontSize: 14, color: Color(0xff8E8EA9)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit the number',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              PinCodeTextField(
                backgroundColor: AppColors.backGroundColor,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                cursorColor: Color(0x10101038),
                cursorHeight: 16,
                appContext: context,
                length: 4,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.scale,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 50,
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
              ),
              const SizedBox(height: 43),
              Row(
                children: [
                  const Text(
                    "Didn’t receive a code? ",
                    style: TextStyle(color: Color(0xff434C6D)),
                  ),
                  GestureDetector(
                    onTap: canResend
                        ? () {
                            startTimer();
                          }
                        : null,
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: canResend ? AppColors.primaryColor : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "0:${seconds.toString().padLeft(2, '0')}",
                    style: const TextStyle(color: Color(0xff434C6D)),
                  ),
                ],
              ),
              const SizedBox(height: 200),
              CustomButton(
                text: 'Done',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SuccesStage(

                      
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
