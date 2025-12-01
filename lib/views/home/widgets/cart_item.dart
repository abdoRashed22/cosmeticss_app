import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  final String image, title, subTitle, price;
  final int quantity;

  const CartItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        image,
                        height: 102.h,
                        width: 102.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    left: 10.w,
                    child: SizedBox(
                      height: 22.h,
                      width: 22.w,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/svg/delete.svg',
                          width: 19.w,
                          height: 19.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: const Color(0xff3B4569),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: const Color(0xff3B4569).withOpacity(.73),
                          fontSize: 12.sp,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        price,
                        style: TextStyle(
                          color: const Color(0xff3B4569),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 42.h,
                          width: 142.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: const Color(0xff8E8EA9),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.remove,
                                size: 20.sp,
                                color: quantity == 1
                                    ? const Color(0x434C6D82)
                                    : const Color(0xff434C6D),
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                size: 20.sp,
                                color: const Color(0xff434C6D),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: const Color(0xffB3B3C1).withOpacity(.55),
          thickness: 1,
        ),
      ],
    );
  }
}
