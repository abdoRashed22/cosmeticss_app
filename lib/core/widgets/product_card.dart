import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Card(
        color: AppColors.backGroundColor,
        margin: EdgeInsets.zero,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: SizedBox(
          width: 176.w,
          height: 237.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                      height: 160.h,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    width: 32.w,
                    height: 32.h,
                    top: 15.h,
                    right: 10.w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFAFA),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.all(4.w),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff434C6D),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
