// ignore: unused_import
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:live_score_app/core/api/api_const.dart';

class ApiServices {
  ApiServices(this.dio);
  final Dio dio;

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    var response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(headers: ApiConst.headers),
      cancelToken: cancelToken,
    );
    //   log(response.toString());
    return response.data;
  }
}
