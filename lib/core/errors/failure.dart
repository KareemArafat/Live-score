import 'package:dio/dio.dart';

class Failure {
  String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with Api server');
      case DioExceptionType.cancel:
        return ServerFailure('Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Oops There was an Error, Please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with server, Please try later');
    }
    // else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    //   return ServerFailure(response['error']['message']);
    // }
    else {
      return ServerFailure('There was an error, Please try again');
    }
  }
}
