import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailuer extends Failure {
  ServerFailuer(super.errMessage);

  factory ServerFailuer.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer('Connection to Api Was Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailuer('Send to Api Was Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailuer('Receive to Api Was Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailuer('Bad to Api Was Certificate');
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailuer('Request to Api Was Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailuer('Connection to Api Was Error');
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailuer('No Internet Connection');
        } else {
          return ServerFailuer('opps, something went wrong, please try later');
        }
    }
  }

  factory ServerFailuer.fromResponse(int? statusCode, dynamic respons) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(respons['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailuer('Your request not found , please try again later');
    } else if (statusCode == 500) {
      return ServerFailuer('Internal server error, please try again later');
    } else {
      return ServerFailuer('opps, something went wrong, please try later');
    }
  }
}
