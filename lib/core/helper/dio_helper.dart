import 'package:dio/dio.dart';

class DioHelper {
  static const _baseUrl = "https://cosmatics.growfet.com";
 static const _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static final  dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers:_headers
    ),
  );

  static Future<CustomResponse> sendData({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await dio.post(path, data: data);

      return CustomResponse(
        isSuccess: true,
        data: resp.data,
      );
    } on DioException catch (e) {
      return CustomResponse(
        isSuccess: false,
        message: e.response?.data?['message'] ?? 'Something went wrong',
      );
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  final String? message;
  final dynamic data;

  CustomResponse({
    required this.isSuccess,
    this.message,
    this.data,
  });
}