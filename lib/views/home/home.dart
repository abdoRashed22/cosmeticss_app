import 'package:cosmetics/core/widgets/product_card.dart';
import 'package:cosmetics/core/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 12.h,
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SearchInput(),
            SizedBox(height: 15.h),

            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 320.h,
                  child: Image.asset(
                    'assets/png/layer1.png',
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  top: 85.h,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 10.w,
                    height: 150.h,
                    child: SvgPicture.asset(
                      'assets/svg/home_layer2.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 110.h,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 70.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "50% OFF DISCOUNT\nCUPON CODE : 125865",
                              style: TextStyle(
                                color: const Color(0xff62322D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/svg/home_layer3.svg',
                              width: 55.w,
                              height: 55.h,
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/home_layer3.svg',
                              width: 55.w,
                              height: 55.h,
                            ),
                            Text(
                              "Hurry up! \nSkin care only !",
                              style: TextStyle(
                                color: const Color(0xff434C6D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 26.h),

            Row(
              children: [
                Text(
                  'Top rated products',
                  style: TextStyle(
                    color: const Color(0xff434C6D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ProductCard(
                  imageUrl: 'assets/png/pro1.jpg',
                  title: 'Mango',
                  price: '20',
                ),
                ProductCard(
                  imageUrl: 'assets/png/pro2.jpg',
                  title: 'Mango',
                  price: '20',
                ),
              ],
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
