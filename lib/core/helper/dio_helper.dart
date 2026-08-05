import 'package:dio/dio.dart';

class DioHelper {
  static const _baseUrl = "https://cosmatics.growfet.com/";
  static const _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static final dio = Dio(BaseOptions(baseUrl: _baseUrl, headers: _headers));

  /*static Future<CustomResponse> getData({
    String path = "",
      Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final resp = await dio.get(path);
      Map<String, dynamic> data;
      if (resp.data is List) {
        data = {'list': resp.data};
      } else {
        data = resp.data;
      }
      return CustomResponse(isSuccess: true, data: data);
    } on DioException catch (ex) {
      return CustomResponse(
        isSuccess: false,
        message: ex.response?.data?['message'] ?? 'Something went wrong',
      );
    }
  }*/

  static Future<CustomResponse> sendData({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    //final token =
    //  "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxODMwNiIsInVuaXF1ZV9uYW1lIjoiYWJkZWxyYWhtYW4yMDA0IiwiZW1haWwiOiJhYmRlbHJhaG1hbi4yMjIyMDA0QGdtYWlsLmNvbSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTc4NTQ4ODEzNCwiZXhwIjoxNzg1NDg4NzM0LCJpYXQiOjE3ODU0ODgxMzQsImlzcyI6IkNvc21hdGljc0FwaSIsImF1ZCI6IkNvc21hdGljc1VzZXJzIn0.ehFZkKiPpzWfMg3QeAjPBEbtXoA4iz-ZMzi0WV7D4c35f1YDFXC4vaxCApO2qkakG5wCNLJODanMAPYCONUC2A";

    //  dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    try {
      final resp = await dio.post(path, data: data);
      print(resp.data);
      if (resp.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: resp.data);
      }
      return CustomResponse(isSuccess: false, data: resp.data);
    } on DioException catch (e) {
      print(e.response?.data);
      if (e.response?.data != null && e.response?.data is Map) {
        print(e.response?.data['message']);
        print(e.response?.statusCode);
      }
      return CustomResponse(isSuccess: false);
    }
  }

  static Future<CustomResponse> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    //final token =
    //  "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxODMwNiIsInVuaXF1ZV9uYW1lIjoiYWJkZWxyYWhtYW4yMDA0IiwiZW1haWwiOiJhYmRlbHJhaG1hbi4yMjIyMDA0QGdtYWlsLmNvbSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTc4NTQ4ODEzNCwiZXhwIjoxNzg1NDg4NzM0LCJpYXQiOjE3ODU0ODgxMzQsImlzcyI6IkNvc21hdGljc0FwaSIsImF1ZCI6IkNvc21hdGljc1VzZXJzIn0.ehFZkKiPpzWfMg3QeAjPBEbtXoA4iz-ZMzi0WV7D4c35f1YDFXC4vaxCApO2qkakG5wCNLJODanMAPYCONUC2A";

    //  dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    try {
      final resp = await dio.get(path, data: queryParameters);

      if (resp.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: resp.data);
      }
      return CustomResponse(isSuccess: false);
    } on DioException catch (e) {
      print(e.response?.data);

      return CustomResponse(isSuccess: false, data: e.response?.data);
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  late final String? message;
  final dynamic data;

  CustomResponse({required this.isSuccess, this.data}) {
    message = data is Map ? data['message'] : null;
  }
}
