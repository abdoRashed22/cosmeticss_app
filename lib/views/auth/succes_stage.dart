import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
// تأكد من استيراد ملف MainView هنا
import 'package:cosmetics/views/home/main_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesStage extends StatefulWidget {
  const SuccesStage({super.key});
final String title = "Account Activated!";
  @override
  State<SuccesStage> createState() => _SuccesStageState();
}

class _SuccesStageState extends State<SuccesStage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.backGroundColor,
            contentPadding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: AppColors.backGroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Lottie.asset(
                    'assets/lottie/success.json',
                    height: 100,
                    width: 100,
                    repeat: false,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Account Activated!",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Congratulations! Your account \nhas been successfully activated",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8E8EA9),
                  ),
                ),
                const SizedBox(height: 23),
                CustomButton(
                  text: 'Go To Home',
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainView()),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    });

    return const Scaffold(body: SizedBox());
  }
}
