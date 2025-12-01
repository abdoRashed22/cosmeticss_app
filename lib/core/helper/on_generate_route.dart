import 'package:cosmetics/on_boarding_page.dart';
import 'package:cosmetics/splash_page.dart';
import 'package:cosmetics/views/auth/create_account.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/succes_stage.dart';
import 'package:cosmetics/views/home/cart.dart';
import 'package:cosmetics/views/home/category.dart';
import 'package:cosmetics/views/home/home.dart';
import 'package:cosmetics/views/home/main_view.dart';
import 'package:cosmetics/views/home/profile.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case 'onBoarding':
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case 'createAccount':
        return MaterialPageRoute(builder: (_) => CreateAccountPage());

      case 'main':
        return MaterialPageRoute(builder: (_) => MainView());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'cart':
        return MaterialPageRoute(builder: (_) => CartView());
      case 'category':
        return MaterialPageRoute(builder: (_) => CategoryView());
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfileView());
      case 'succesStage':
        return MaterialPageRoute(builder: (_) => SuccesStage());
      case 'forgetPassword':
        return MaterialPageRoute(builder: (_) => ForgetPassword());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
