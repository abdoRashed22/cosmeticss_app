import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDown extends StatefulWidget {
  const AppDropDown({super.key});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  String selectedCode = '+20';
  final numList = ['+20', '+966', '+36'];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 85.w,
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey, width: 1.w),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCode,
              icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
              items: numList
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
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
