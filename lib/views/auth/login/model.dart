class UserData {
  UserData({
    required this.token,
    required this.refreshToken,
    required this.user,
  });
  late final String token;
  late final String refreshToken;
  late final LoginModel user;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? "";
    refreshToken = json['refreshToken'];
    user = LoginModel.fromJson(json['user']);
  }
}

class LoginModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;
  late final Null otpCode;
  late final Null otpExpiration;

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    countryCode = json['countryCode'] ?? "";
    role = json['role'] ?? "";
    profilePhotoUrl = json['profilePhotoUrl'] ?? "";
    otpCode = null;
    otpExpiration = null;
  }
}
