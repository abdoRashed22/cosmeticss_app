import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/home/pages/category.dart';
import 'package:cosmetics/views/home/pages/home.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 3;
  final list = [
    _Models(
      Home(),
      'assets/icons/selected_home.svg',
      'assets/icons/un_selected_home.svg',
    ),
    _Models(
      Cart(),
      'assets/icons/selected_cart.svg',
      'assets/icons/un_selected_my_cart.svg',
    ),
    _Models(
      Category(),
      'assets/icons/selected_category.svg',
      'assets/icons/un_selected_categories.svg',
    ),
    _Models(
      Profile(),
      'assets/icons/selected_profile.svg',
      'assets/icons/un_selected_profile.svg',
    ),
  ];

  //final screens = [Home(), Cart(), Category(), Profile()];

  /* final selectedIcons = [
    'assets/icons/selected_home.svg',
    'assets/icons/selected_cart.svg',
    'assets/icons/selected_category.svg',
    'assets/icons/selected_profile.svg',
  ];

  final unselectedIcons = [
    'assets/icons/un_selected_home.svg',
    'assets/icons/un_selected_my_cart.svg',
    'assets/icons/un_selected_categories.svg',
    'assets/icons/un_selected_profile.svg',
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 20.h),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 4,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: Colors.black.withValues(alpha: .1),
            ),
            BoxShadow(
              offset: const Offset(-4, -4),
              blurRadius: 6,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.backGroundColor,
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0.sp,
          unselectedFontSize: 0.sp,
          items: List.generate(4, (index) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                currentIndex == index
                    ? list[index].selectedIcons
                    : list[index].unselectedIcons,
                width: 22.w,
                height: 22.h,
              ),
              label: index == 0
                  ? 'Home'
                  : index == 1
                  ? 'Cart'
                  : index == 2
                  ? 'Category'
                  : 'Profile',
            );
          }),
        ),
      ),
      body: list[currentIndex].page,
      //bottomNavigationBar: SizedBox(height: 40.h),
    );
  }
}

class _Models {
  final String selectedIcons, unselectedIcons;
  final Widget page;
  _Models(this.page, this.selectedIcons, this.unselectedIcons);
}
