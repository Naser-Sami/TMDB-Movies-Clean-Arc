import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '/core/core.dart';

abstract class BaseUsecase<T, P> {
  // p => parameters
  Future<Either<Failure, T>> call(P p);
}

// without any parameters
class NoP extends Equatable {
  const NoP();

  @override
  List<Object?> get props => [];
}
