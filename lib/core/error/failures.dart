import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;
  
  const Failure(this.message, [this.code]);
  
  @override
  List<Object?> get props => [message, code];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(String message, [String? code]) : super(message, code);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message, 'CACHE_ERROR');
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message, 'NETWORK_ERROR');
}

class ValidationFailure extends Failure {
  final Map<String, List<String>>? errors;
  
  const ValidationFailure(String message, {this.errors}) : super(message, 'VALIDATION_ERROR');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Unauthorized access', '401');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message) : super(message, '404');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('Request timeout', 'TIMEOUT');
}

class UnknownFailure extends Failure {
  const UnknownFailure([String? message]) : super(message ?? 'Unknown error occurred');
} 