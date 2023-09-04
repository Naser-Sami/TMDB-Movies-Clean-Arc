
import '/core/core.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  // final ErrorMessageModel errorMessageModel;
  // or
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}