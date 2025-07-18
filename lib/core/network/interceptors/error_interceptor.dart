import 'package:dio/dio.dart';
import '../../error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException('Connection timeout');
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.response?.data['message'] ?? 'Bad request');
          case 401:
            throw UnauthorizedException('Unauthorized');
          case 403:
            throw ForbiddenException('Forbidden');
          case 404:
            throw NotFoundException('Not found');
          case 500:
            throw InternalServerException('Internal server error');
          default:
            throw ServerException('Server error: ${err.response?.statusCode}');
        }
      case DioExceptionType.cancel:
        throw RequestCancelledException('Request cancelled');
      default:
        throw NetworkException('Network error');
    }
  }
} 