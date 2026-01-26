import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.hintText,
    this.controller,
    this.onSearchTap,
  });

  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback? onSearchTap;

  @override
  Widget build(BuildContext context) {
    return TextFormFeild(
      
      hintText: hintText ?? 'Search',
      labledText: 'search',
      textInputType: TextInputType.text,
      controller: controller,
      obscureText: false,
      suffix: GestureDetector(
        onTap: onSearchTap,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            width: 18.w,
            height: 18.h,
          ),
        ),
      ),
    );
  }
}
