import '../../core.dart';

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return const Failure(
          ResponseCode.SUCCESS,
          ResponseMessage.SUCCESS,
        );
      case DataSource.NO_CONTENT:
        return const Failure(
          ResponseCode.NO_CONTENT,
          ResponseMessage.NO_CONTENT,
        );
      case DataSource.BAD_REQUEST:
        return const Failure(
          ResponseCode.BAD_REQUEST,
          ResponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return const Failure(
          ResponseCode.FORBIDDEN,
          ResponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTHORIZED:
        return const Failure(
          ResponseCode.UNAUTHORIZED,
          ResponseMessage.UNAUTHORIZED,
        );
      case DataSource.NOT_FOUND:
        return const Failure(
          ResponseCode.NOT_FOUND,
          ResponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return const Failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return const Failure(
          ResponseCode.CONNECT_TIMEOUT,
          ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return const Failure(
          ResponseCode.CANCEL,
          ResponseMessage.CANCEL,
        );
      case DataSource.RECEIVE_TIMEOUT:
        return const Failure(
          ResponseCode.RECEIVE_TIMEOUT,
          ResponseMessage.RECEIVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return const Failure(
          ResponseCode.SEND_TIMEOUT,
          ResponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return const Failure(
          ResponseCode.CACHE_ERROR,
          ResponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return const Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSource.DEFAULT:
        return const Failure(
          ResponseCode.DEFAULT,
          ResponseMessage.DEFAULT,
        );
    }
  }
}
