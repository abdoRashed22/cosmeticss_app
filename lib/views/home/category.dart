import 'package:cosmetics/core/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "Bundles", "image": "assets/png/bundles.png"},
    {"name": "Perfumes", "image": "assets/png/perfumes.png"},
    {"name": "Makeup", "image": "assets/png/bundles.png"},
    {"name": "Skin Care", "image": "assets/png/perfumes.png"},
    {"name": "Gifts", "image": "assets/png/gifts.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Center(
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff434C6D),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SearchInput(onSearchTap: () {}),
            SizedBox(height: 25.h),
            Expanded(
              child: ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Divider(
                    color: Colors.grey.withOpacity(.5),
                    thickness: 1,
                  ),
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          item["image"],
                          width: 70.w,
                          height: 65.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Text(
                          item["name"],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff434C6D),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/svg/arrow-right.svg",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
