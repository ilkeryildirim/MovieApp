import 'package:dio/dio.dart';
import '../../error/exceptions.dart';
import '../../constants/app_strings.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is AppException) {
      handler.next(err);
      return;
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: TimeoutException(AppStrings.connectionTimeout),
          ),
        );
        break;
      case DioExceptionType.badResponse:
        _handleBadResponse(err, handler);
        break;
      case DioExceptionType.cancel:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: RequestCancelledException(AppStrings.requestCancelled),
          ),
        );
        break;
      default:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: NetworkException(AppStrings.networkError),
          ),
        );
    }
  }

  void _handleBadResponse(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final responseData = err.response?.data;
    String? message;

    // Try to extract message from response
    if (responseData is Map<String, dynamic>) {
      message = responseData['message'] as String?;
    }

    switch (statusCode) {
      case 400:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: BadRequestException(message ?? AppStrings.badRequest),
          ),
        );
        break;
      case 422:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ValidationException(
              message ?? AppStrings.validationFailed,
              errors: _parseValidationErrors(responseData),
            ),
          ),
        );
        break;
      default:
        // Let other status codes (401, 403, 404, 500) be handled by AuthInterceptor
        handler.next(err);
    }
  }

  Map<String, List<String>>? _parseValidationErrors(dynamic responseData) {
    if (responseData is Map<String, dynamic> && responseData.containsKey('errors')) {
      final errors = responseData['errors'];
      if (errors is Map<String, dynamic>) {
        return errors.map((key, value) {
          if (value is List) {
            return MapEntry(key, value.cast<String>());
          }
          return MapEntry(key, [value.toString()]);
        });
      }
    }
    return null;
  }
} 