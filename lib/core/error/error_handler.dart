// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import '../core.dart';


class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handler(dynamic error) {
    if (error is DioException) {
      // dio error so it's an error form response from API
      // or from dio itself
      failure = _handlerError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}


class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}


Failure _handlerError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();

    default:
      DioExceptionType.badCertificate;
      return DataSource.DEFAULT.getFailure();
  }
}
