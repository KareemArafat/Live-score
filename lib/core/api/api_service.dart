// ignore: unused_import
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:live_score_app/core/api/api_const.dart';

class ApiServices {
  ApiServices(this._dio);
  final Dio _dio;

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(headers: ApiConst.headers),
    );
    //   log(response.toString());
    return response.data;
  }

  Future<Response<dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.post(
      endPoint,
      data: data,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Map<String, dynamic>> patch({
    required String endPoint,
    required Object data,
    Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.patch(
      endPoint,
      data: data,
      options: Options(headers: headers),
      onSendProgress: (count, total) {},
    );
    return response.data;
  }

  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.delete(
      endPoint,
      data: body,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    return response;
  }
}
