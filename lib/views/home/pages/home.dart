import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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

              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppImage(
                      image: 'layer1.png',
                      height: 320.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 320.h,
                      /* child: Image.asset(
                        'assets/images/layer1.png',
                        fit: BoxFit.fill,
                      ),*/
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Color(0xffE9DCD3).withValues(alpha: .8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "50% OFF DISCOUNT\nCUPON CODE : 125865",
                                style: TextStyle(
                                  color: const Color(0xff62322D),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/home_layer3.svg',
                                width: 55.w,
                                height: 55.h,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/home_layer3.svg',
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

                    /*    Positioned(
                      top: 85.h,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 10.w,
                        height: 150.h,
                        child: SvgPicture.asset(
                          'assets/icons/home_layer2.svg',
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
                                  'assets/icons/home_layer3.svg',
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
                                  'assets/icons/home_layer3.svg',
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
                    ),*/
                  ],
                ),
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
              GridView.builder(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 176 / 237,
                ),
                itemBuilder: (context, index) {
                  /*return ProductCard(
                    imageUrl: 'assets/images/pro1.jpg',
                    title: 'Mango',
                    price: '20',
                  );*/
                  return ProductItem();
                },
                itemCount: 6,
              ),

              /*   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: ProductCard(
                      imageUrl: 'assets/images/pro1.jpg',
                      title: 'Mango',
                      price: '20',
                    ),
                  ),
                  // SizedBox(width: 6),
                  Expanded(
                    child: ProductCard(
                      imageUrl: 'assets/images/pro2.jpg',
                      title: 'Mango',
                      price: '20',
                    ),
                  ),
                ],
              ),*/
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

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
            "Athe Red lipstick",
            style: TextStyle(
              color: const Color(0xff434C6D),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            "\$20",
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
