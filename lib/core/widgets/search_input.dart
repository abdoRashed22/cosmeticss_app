import 'package:cosmetics/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/svg/search.svg',
            width: 18,
            height: 18,
          ),
        ),
      ),
    );
  }
}
