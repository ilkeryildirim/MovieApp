// Base exception class
abstract class AppException implements Exception {
  final String message;
  final String? code;
  
  const AppException(this.message, [this.code]);
  
  @override
  String toString() => '$runtimeType: $message${code != null ? ' (Code: $code)' : ''}';
}

// Network exceptions
class NetworkException extends AppException {
  const NetworkException(String message, [String? code]) : super(message, code);
}

class TimeoutException extends NetworkException {
  const TimeoutException(String message) : super(message, 'TIMEOUT');
}

class ServerException extends NetworkException {
  const ServerException(String message, [String? code]) : super(message, code);
}

class BadRequestException extends ServerException {
  const BadRequestException(String message) : super(message, '400');
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException(String message) : super(message, '401');
}

class ForbiddenException extends ServerException {
  const ForbiddenException(String message) : super(message, '403');
}

class NotFoundException extends ServerException {
  const NotFoundException(String message) : super(message, '404');
}

class InternalServerException extends ServerException {
  const InternalServerException(String message) : super(message, '500');
}

class RequestCancelledException extends NetworkException {
  const RequestCancelledException(String message) : super(message, 'CANCELLED');
}

// Cache exceptions
class CacheException extends AppException {
  const CacheException(String message, [String? code]) : super(message, code);
}

// Validation exceptions
class ValidationException extends AppException {
  final Map<String, List<String>>? errors;
  
  const ValidationException(String message, {this.errors}) : super(message, 'VALIDATION_ERROR');
} 