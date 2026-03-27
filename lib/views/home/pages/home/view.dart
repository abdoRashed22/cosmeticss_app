import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
part 'widgets/list.dart';

part 'widgets/offers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: SafeArea(
          child: Column(
            children: [
              const SearchInput(),
              SizedBox(height: 15.h),

              const _Offers(),

              SizedBox(height: 26.h),

              _List(title: "Top rated products"),
              SizedBox(height: 26.h),

              _List(title: "Most Order Products"),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 10,
            blurStyle: BlurStyle.inner,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: .25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),

              child: AppImage(
                image: 'pro1.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            product.name,
            style: TextStyle(
              color: const Color(0xff434C6D),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            product.price.toString(),
            style: TextStyle(
              color: Color(0xff70839C),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
