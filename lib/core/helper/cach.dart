import 'dart:developer';
import 'package:cosmetics/views/auth/login/model.dart';
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

  static bool get isAuth {
    return token.isNotEmpty;
  }

  static String get token {
    return _prefs.getString('token') ?? "";
  }

  static String getName() {
    return _prefs.getString('username') ?? 'Visitor';
  }

  static String getImage() {
    return _prefs.getString('profilePhotoUrl') ??
        "https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/751041170_2107912153468869_7454071587707926374_n.jpg?stp=dst-jpg_tt6&cstp=mx2045x2048&ctp=s2045x2048&_nc_cat=107&_nc_map=urlgen_bucketless&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGeZB6FHwd0JGFhKgp_hy1d8Mv3Gst89ZDwy_cay3z1kKb7cdmPPbGNvHhp96ogcq1l6rBpIih6u2gaaxZq0zR6&_nc_ohc=Bo9027puSQgQ7kNvwHPGIgH&_nc_oc=AdpZzHJ-oKeTszv4sTj9ccxN8jJIRESYSrTW_2n_uam6UL14ehzI07tJzVRslJkFfyg&_nc_zt=23&_nc_ht=scontent.fcai20-1.fna&_nc_gid=DscR4lfTf8g69ncYN18ITA&_nc_ss=7b2a8&oh=00_AQH7YCLHkYQDsYY6rehx9Tuvz3c4ksfXrEhQSrvxK3gX0A&oe=6A78C85B";
  }

  static Future<void> logout() async {
    // note here is a problem to use clear method because it will clear all the data in the shared preferences, so we need to clear only the data that we want to clear
    //so we will use remove method to remove the data that we want to remove

    await _prefs.remove('token');
    await _prefs.remove('refreshToken');
    await _prefs.remove('email');
    await _prefs.remove('username');
    await _prefs.remove('profilePhotoUrl');
    await _prefs.remove('phoneNumber');
    await _prefs.remove('countryCode');
    await _prefs.remove('role');
    log('test logout');
  }

  static Future<void> saveUserData({UserData? data, LoginModel? model}) async {
    if (data == null && model == null) {
      return;
    }
    if (data != null) {
      _prefs.setString("token", data.token);
      model = data.user;
      _prefs.setString("refreshToken", data.refreshToken);
    }
    if (model != null) {
      _prefs.setString("email", model.email);

      _prefs.setString("username", model.username);
      _prefs.setString("profilePhotoUrl", model.profilePhotoUrl);
      _prefs.setString("phoneNumber", model.phoneNumber);
      _prefs.setString("countryCode", model.countryCode);
      _prefs.setInt("role", model.id);
    }
  }
}
