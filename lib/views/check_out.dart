import 'package:cosmetics/core/widgets/custom_back_button.dart';
import 'package:cosmetics/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(passingValue: 16),
        title: const Text('Check Out'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff29D3DA).withValues(alpha: .11),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Delivery to'),
                SizedBox(height: 18.h),
                _Tile(
                  title: 'Mansoura',
                  leading: Container(
                    height: 60.h,
                    width: 97.w,
                    color: Colors.red,
                  ),
                  subTitle: "mansoura, 14 portsiad",
                  buttomSpace: 40.h,
                ),
                Text('Payment Method'),
                SizedBox(height: 18.h),
                _Tile(
                  title: '**** **** **** 1234',
                  leadingImage: 'assets/icons/meza.svg',
                  buttomSpace: 12.h,
                ),
                _Tile(
                  title: 'Add vaucher',
                  leadingImage: 'assets/icons/voucher1.svg',
                  trailing: CustomButton(
                    text: 'Apply',
                    height: 35.h,
                    width: 77.w,
                    textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  buttomSpace: 32.h,
                ),
                Text(
                  "-" * 100,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,

                    color: Color(0xff434C6D).withValues(alpha: .30),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "- REVIEW PAYMENT",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 20.h),

                Text(
                  "PAYMENT SUMMARY",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 40.h),
                _detailsText(title: "Subtotal", value: "16.100 EGP"),
                SizedBox(height: 10.h),
                _detailsText(title: "SHIPPING FEES", value: "TO BE CALCULATED"),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 35.w,
                  ),
                  child: Divider(
                    thickness: 1.5.w,
                    //  height: 698.h,
                    color: Color(0xff73B9BB),
                  ),
                ),
                _detailsText(
                  title: "TOTAL + VAT",
                  value: "16.100 EGP",
                  valueFontWeight: FontWeight.w700,
                ),
                SizedBox(height: 35.h),
                Center(
                  child: CustomButton(
                    icon: "assets/icons/order1.svg",
                    text: "Order",
                    height: 65,
                    width: 270,
                    borderRadius: 60,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _detailsText extends StatelessWidget {
  const _detailsText({
    super.key,
    this.valueFontWeight = FontWeight.w500,
    required this.title,
    required this.value,
  });
  final String title, value;
  final FontWeight valueFontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(fontWeight: valueFontWeight, fontSize: 12.sp),
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  _Tile({
    super.key,
    required this.title,
    this.subTitle,
    this.leadingImage,
    this.leading,
    this.trailing,
    this.buttomSpace = 0,
  });
  final String title;
  final double buttomSpace;
  final String? subTitle, leadingImage;
  final Widget? leading, trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
      ).copyWith(bottom: buttomSpace.h),
      child: ListTile(
        //dense: true,
        visualDensity: VisualDensity(vertical: -1),
        horizontalTitleGap: 10,
        contentPadding: leading != null ? EdgeInsets.all(12.r) : null,

        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff73B9BB), width: 1.5.w),
          borderRadius: BorderRadiusGeometry.circular(30.r),
        ),
        leading:
            leading ??
            SvgPicture.asset(leadingImage!, width: 30.w, height: 20.h),
        title: Text(
          title,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
        subtitle: subTitle == null
            ? null
            : Text(
                subTitle!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8E8EA9),
                ),
              ),
        trailing:
            trailing ??
            SvgPicture.asset(
              "assets/icons/down2.svg",
              color: Color(0xffD75D72),
              width: 22.w,
              height: 22.h,
            ),
      ),
    );
  }
}
/*   Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: ListTile(
                    horizontalTitleGap: 10,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      //vertical: 18.h,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xff73B9BB), width: 1.5.w),
                      borderRadius: BorderRadiusGeometry.circular(30.r),
                    ),
          
                    leading: SvgPicture.asset(
                      'assets/icons/meza.svg',
                      width: 30.w,
                      height: 20.h,
                    ),
                    title: Text(
                      '**** **** **** 1234',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
          
                    trailing: SvgPicture.asset(
                      "assets/icons/arrow.svg",
                      color: Colors.pink,
                    ),
                  ),
                ), */