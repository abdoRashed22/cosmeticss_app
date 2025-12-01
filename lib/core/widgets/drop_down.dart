import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDown extends StatefulWidget {
  const AppDropDown({super.key});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  String selectedCode = "+20";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 85.w,
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey, width: 1.w),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCode,
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
              items: const [
                DropdownMenuItem(value: "+20", child: Text("+20")),
                DropdownMenuItem(value: "+966", child: Text("+966")),
                DropdownMenuItem(value: "+971", child: Text("+971")),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selectedCode = val;
                  });
                }
              },
            ),
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
