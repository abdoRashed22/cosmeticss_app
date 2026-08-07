import 'package:cosmetics/core/helper/app_colors.dart';
import 'package:cosmetics/core/helper/cach.dart';
import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/home/pages/categories/view.dart';
import 'package:cosmetics/views/home/pages/home/view.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final resp = await DioHelper.getData(path: "/api/Auth/profile");
    if (resp.isSuccess) {
      final data = UserModel.fromJson(resp.data);
      await Cach.saveUserData(model: data);
    } else {
      print(resp.message);
    }
    if (!mounted)
      return; //best practice to check if the widget is still mounted before calling setState
    setState(() {});
  }

  final list = [
    _Models(
      HomePage(),
      'assets/icons/selected_home.svg',
      'assets/icons/un_selected_home.svg',
    ),
    _Models(
      Cart(),
      'assets/icons/selected_cart.svg',
      'assets/icons/un_selected_my_cart.svg',
    ),
    _Models(
      CategoryPage(),
      'assets/icons/selected_category.svg',
      'assets/icons/un_selected_categories.svg',
    ),
    _Models(
      Profile(),
      'assets/icons/selected_profile.svg',
      'assets/icons/un_selected_profile.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex].page,
      bottomNavigationBar: Container(
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
              color: Colors.black.withValues(alpha: .1),
            ),
            BoxShadow(
              offset: const Offset(-4, -4),
              blurRadius: 6,
              blurStyle: BlurStyle.outer,
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
    );
  }
}

class _Models {
  final String selectedIcons;
  final String unselectedIcons;
  final Widget page;

  _Models(this.page, this.selectedIcons, this.unselectedIcons);
}
