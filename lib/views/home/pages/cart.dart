import 'package:cosmetics/views/home/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItemWidget> products = const [
      CartItemWidget(
        image: "pro2.jpg",
        title: "Note Cosmetics",
        subTitle: "Ultra rich mascara for lashes",
        price: "350 EGP",
        // quantity: 1,
      ),
      CartItemWidget(
        image: "pro2.jpg",
        title: "ARTDECO",
        subTitle: "Bronzer - 02",
        price: "490 EGP",
        // quantity: 2,
      ),
      CartItemWidget(
        image: "pro2.jpg",
        title: "Channel",
        subTitle: "L’eau de parfum N5",
        price: "15,000 EGP",
        //  quantity: 1,
      ),
      CartItemWidget(
        image: "pro1.jpg",
        title: "Channel",
        subTitle: "L’eau de parfum N5",
        price: "15,000 EGP",
        // quantity: 1,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "My Cart",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff434C6D),
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/shopping_cart.svg",
                    height: 26.h,
                    width: 26.w,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    "  You have ${products.length} products in your cart",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff434C6D).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: products,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
