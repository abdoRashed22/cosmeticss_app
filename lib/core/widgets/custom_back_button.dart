import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final String iconPath;
  final double passingValue;

  const CustomBackButton({
    super.key,
    this.onTap,
    this.size = 15,
    this.iconPath = 'assets/icons/arrow.svg',
    this.passingValue = 0,

    // this.iconPath = 'assets/icons/arrow_back_page.svg',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context) ;
      },
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: passingValue == 0
              ? EdgeInsets.zero
              : EdgeInsets.only(left: passingValue.w),
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: Color(0xff101010).withValues(alpha: .05),
            child: Transform.rotate(
              angle: pi,
              child: SvgPicture.asset(
                iconPath,
                width: size,
                height: size,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
    /* GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: SvgPicture.asset(
        iconPath,
        width: size,
        height: size,
      ),
    );*/
  }
}
