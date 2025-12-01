import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFeild extends StatefulWidget {
  const TextFormFeild({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.prefix,
    this.suffix, 
    this.onSaved,
    this.isPassword = false,
    this.controller,
    required this.obscureText,
    this.validator,
    required this.labledText,
  });

  final String hintText;
  final String labledText;
  final TextInputType textInputType;
  final Widget? prefix;
  final Widget? suffix; 
  final bool isPassword;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<TextFormFeild> createState() => _TextFormFeildState();
}

class _TextFormFeildState extends State<TextFormFeild> {
  bool isSeen = true;

  @override

  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: widget.controller,
      validator: widget.validator,
      onSaved: widget.onSaved,
      obscureText: widget.obscureText ? isSeen : false,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        labelText: widget.labledText,
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.backGroundColor,
        prefixIcon: widget.prefix,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: SvgPicture.asset(
                  isSeen
                      ? 'assets/svg/visible_off.svg'
                      : 'assets/svg/visible_on.svg',
                  width: 22,
                  height: 15,
                ),
                onPressed: () {
                  setState(() {
                    isSeen = !isSeen;
                  });
                },
              )
            : widget.suffix, 
      ),
    );
  }
}
