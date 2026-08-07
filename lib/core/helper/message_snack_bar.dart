import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// Shows a SnackBar using the global [navigatorKey] so it can be called from
/// anywhere (controllers, helpers, async callbacks) without a BuildContext.
/// Returns `true` if the SnackBar was shown, `false` otherwise.
bool showCustomSnackBar({
  required String message,
  BuildContext? context,
  final backgroundColor = Colors.green,
  final textColor = Colors.white,
  Duration duration = const Duration(seconds: 2),
}) {
  // Determine a valid context: prefer the passed one, fallback to navigatorKey.
  final ctx = context ?? navigatorKey.currentContext;
  if (ctx == null || message.isEmpty) return false;

  final messenger = ScaffoldMessenger.maybeOf(ctx);
  if (messenger == null) return false;

  messenger.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor, fontSize: 16.sp),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),
  );
  return true;
}

/// Shows a SnackBar using the global [navigatorKey] — safe to call from
/// anywhere. Returns `true` if shown, `false` otherwise.
bool showMsg(String? msg, {bool isError = false}) {
  if (msg == null || msg.isEmpty) return false;
  final ctx = navigatorKey.currentContext;
  if (ctx == null) return false;

  final messenger = ScaffoldMessenger.maybeOf(ctx);
  if (messenger == null) return false;

  messenger.showSnackBar(
    SnackBar(
      content: Text(msg),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    ),
  );
  return true;
}
