import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color? color;
  final bool isLogOut;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.color,
    this.isLogOut = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.sp,
          color: color ?? const Color(0xff434C6D),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: isLogOut
          ? null
          : IconButton(
              icon: SvgPicture.asset(
                'assets/svg/arrow-right.svg',
                width: 24.w,
                height: 24.h,
              ),
              onPressed: () {},
            ),
    );
  }
}
