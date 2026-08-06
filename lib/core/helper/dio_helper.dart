import 'dart:developer';

import 'package:cosmetics/core/helper/cach.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static const _baseUrl = "https://cosmatics.growfet.com/";
  static final _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static final dio = Dio(BaseOptions(baseUrl: _baseUrl, headers: _headers));

  static Future<CustomResponse> sendData({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers.addAll({"Authorization": 'Bearer  ${Cach.token}'});
    log("test headers ${dio.options.headers}");
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
        log(e.response?.data['message']);
        //  log(e.response?.data["CountryCode"][0] ?? "no country code");
        print(e.response?.statusCode);
      }
      if (e.response?.statusCode == 401) {
        Cach.logout();
        log("test logout");
        showCustomSnackBar(
          context: navigatorKey.currentContext!,
          message: 'Session expired. Please log in again.',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        return CustomResponse(isSuccess: false);
      }
      return CustomResponse(isSuccess: false, data: e.response?.data);
    }
  }

  static Future<CustomResponse> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers.addAll({"Authorization": 'Bearer  ${Cach.token}'});
    log("test headers ${Cach.token}");
    try {
      final resp = await dio.get(path, data: queryParameters);

      if (resp.statusCode == 200) {
        return CustomResponse(isSuccess: true, data: resp.data);
      }
      return CustomResponse(isSuccess: false);
    } on DioException catch (e) {
      log(e.response?.data);
      if (e.response?.statusCode == 401) {
        Cach.logout();
        log("test logout");
        showCustomSnackBar(
          context: navigatorKey.currentContext!,
          message: 'Session expired. Please log in again.',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        return CustomResponse(isSuccess: false);
      }

      return CustomResponse(isSuccess: false, data: e.response?.data);
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  late final String? message;
  final dynamic data;

  CustomResponse({required this.isSuccess, this.data}) {
    message = data is Map ? data['message'] ?? data["CountryCode"][0] : null;
  }
}
