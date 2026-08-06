import 'package:cosmetics/core/helper/cach.dart';
import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final Widget? destPage;

  const ProfileTile({super.key, required this.title, this.destPage});

  bool get isLogOut => title.toLowerCase() == "logout";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/icons/${title.toLowerCase().replaceAll(' ', '_')}.svg',
        width: 24.w,
        height: 24.h,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: isLogOut ? const Color(0xffCD0F0F) : const Color(0xff434C6D),
        ),
      ),
      trailing: isLogOut
          ? null
          : SvgPicture.asset(
              'assets/icons/arrow-right.svg',
              width: 24.w,
              height: 24.h,
            ),
      onTap: () async {
        if (isLogOut) {
          final resp = await DioHelper.sendData(path: "/api/Auth/logout");

          if (resp.isSuccess) {
            await Cach.logout();
            showCustomSnackBar(
              context: context,
              message: "Logout Successful",
              backgroundColor: Colors.green,
            );
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('login', (route) => false);
          } else {
            showCustomSnackBar(
              context: context,
              message: resp.message ?? "Logout Failed",
              backgroundColor: Colors.red,
            );
          }

          return;
        }

        if (destPage != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => destPage!));
        }
      },
    );
  }
}
