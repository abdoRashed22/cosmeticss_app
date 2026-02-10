import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final Color? color;
  final Widget? destPage;
  const ProfileTile({
    super.key,
    this.destPage,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isLogOut = title.toLowerCase() == 'logout';
    final image = SvgPicture.asset(
      'assets/icons/${title.toLowerCase().replaceAll(' ', '_')}.svg',
      width: 24.w,
      height: 24.h,
    );

    return ListTile(
      leading: image,
      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          color: isLogOut ? const Color(0xffCD0F0F) : const Color(0xff434C6D),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: isLogOut
          ? null
          : IconButton(
              icon: SvgPicture.asset(
                'assets/icons/arrow-right.svg',
                width: 24.w,
                height: 24.h,
              ),
              //  onPressed:onPressed ,
              onPressed: destPage == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => destPage!),
                      );
                    },
            ),
      onTap: destPage == null
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => destPage!),
              );
            },
    );
  }
}
