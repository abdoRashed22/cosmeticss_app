import 'package:cosmetics/on_boarding_page.dart';
import 'package:cosmetics/splash_page.dart';
import 'package:cosmetics/views/auth/create_account.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/succes_dialog.dart';
import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/home/pages/category.dart';
import 'package:cosmetics/views/home/pages/home.dart';
import 'package:cosmetics/views/home/main_view.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:cosmetics/views/home/widgets/pin_location.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case 'onBoarding':
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());

      case 'createAccount':
        return MaterialPageRoute(builder: (_) => CreateAccountPage());
case 'createPassword':
        return MaterialPageRoute(builder: (_) => CreatePassword());
      case 'main':
        return MaterialPageRoute(builder: (_) => MainView());
      case 'home':
        return MaterialPageRoute(builder: (_) => Home());
      case 'cart':
        return MaterialPageRoute(builder: (_) => Cart());
      case 'category':
        return MaterialPageRoute(builder: (_) => Category());
      case 'pinLocation':
        return MaterialPageRoute(builder: (_) => PinLocationView());
      case 'profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case 'succesStage':
        return MaterialPageRoute(
          builder: (_) => SuccesDialog(
            title: settings.arguments as String,
            message: settings.arguments as String,
            textButton: settings.arguments as String,
            isFromForget: settings.arguments as bool,
          ),
        );
      case 'forgetPassword':
        return MaterialPageRoute(builder: (_) => ForgetPassword());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
