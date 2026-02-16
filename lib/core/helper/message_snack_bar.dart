import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void showCustomSnackBar({
  required BuildContext context,
  required String message,
  final backgroundColor = Colors.green,
  final textColor = Colors.white,
  Duration duration = const Duration(seconds: 2),
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: textColor, fontSize: 16.sp),
    ),
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/* void showMsg(String msg) {
  if(msg.isNotEmpty){
 ScaffoldMessenger.of(
    navigatorKey.currentContext,
  ).showSnackBar(SnackBar(content: Text(msg)));
  }
 
}
 */