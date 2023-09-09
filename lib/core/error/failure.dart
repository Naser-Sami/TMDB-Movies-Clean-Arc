import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int statusCode;
  final String message;
  const Failure(this.statusCode, this.message);

  @override
  List<Object?> get props => [statusCode, message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.statusCode, super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.statusCode, super.message);
}