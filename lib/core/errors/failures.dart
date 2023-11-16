import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure();
}

// General Failures
class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class InternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  final String message;
  final String strErrorCode;

  ApiFailure({required this.message, this.strErrorCode = ""});
  @override
  List<Object?> get props => [message];
}

class GeneralFailure extends Failure {
  @override
  List<Object> get props => [];
}
