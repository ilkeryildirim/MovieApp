import 'package:dio/dio.dart';
import '../../di/injection.dart';
import '../../error/exceptions.dart';
import '../../constants/app_strings.dart';
import '../../../data/datasources/local/auth_local_datasource.dart';

class AuthInterceptor extends Interceptor {
  AuthLocalDataSource? _authLocalDataSource;
  
  AuthLocalDataSource get _localDataSource {
    _authLocalDataSource ??= getIt<AuthLocalDataSource>();
    return _authLocalDataSource!;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Skip auth
      if (_shouldSkipAuth(options.path)) {
        handler.next(options);
        return;
      }

      final token = await _localDataSource.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      
      handler.next(options);
    } catch (e) {
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    
    switch (statusCode) {
      case 401:
        await _handleUnauthorized();
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: UnauthorizedException(AppStrings.sessionExpiredPleaseLoginAgain),
          ),
        );
        break;
      case 403:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ForbiddenException(AppStrings.accessDenied),
          ),
        );
        break;
      case 404:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: NotFoundException(AppStrings.resourceNotFound),
          ),
        );
        break;
      case 500:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: InternalServerException(AppStrings.serverErrorOccurred),
          ),
        );
        break;
      default:
        super.onError(err, handler);
    }
  }

  bool _shouldSkipAuth(String path) {
    final authSkipPaths = [
      '/user/login',
      '/user/register',
    ];
    
    return authSkipPaths.any((skipPath) => path.contains(skipPath));
  }

  Future<void> _handleUnauthorized() async {
    try {
      // Clear all local auth data
      await _localDataSource.clearUser();
      // You can also trigger a logout event here if needed
      // For example: getIt<AuthBloc>().add(AuthEvent.logout());
    } catch (e) {
      // Ignore errors during cleanup
    }
  }
} 