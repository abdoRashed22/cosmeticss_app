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
}
