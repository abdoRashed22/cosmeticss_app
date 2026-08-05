import 'package:cosmetics/views/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cach {
  static late SharedPreferences _prefs;
  Future<void> init() async {
    // علشان نستخدم الـ SharedPreferences في كل مكان في التطبيق بدون ما نحتاج نعمل instance منه كل مرة
    _prefs = await SharedPreferences.getInstance();
  }

  static void setIsNotFirstTime(bool value) {
    _prefs.setBool('isFirstTime', value);
  }

  static bool getIsFirstTime() {
    return _prefs.getBool('isFirstTime') ?? true;
  }

  static void setEmail(String email) {
    _prefs.setString('email', email);
  }

  static String getEmail() {
    return _prefs.getString('email') ?? '';
  }

  static bool get IsAuth {
    return (_prefs.getString('token') ?? "").isNotEmpty &&
        (_prefs.getString('refreshToken') ?? "").isNotEmpty;
  }

  static Future<void> saveUserData(UserData model) async {
    _prefs.setString("email", model.user.email);
    _prefs.setString("token", model.token);
    _prefs.setString("refreshToken", model.refreshToken);
    _prefs.setString("username", model.user.username);
    _prefs.setString("profilePhotoUrl", model.user.profilePhotoUrl);
    _prefs.setString("phoneNumber", model.user.phoneNumber);
    _prefs.setString("countryCode", model.user.countryCode);
    _prefs.setInt("role", model.user.id);
  }
}
