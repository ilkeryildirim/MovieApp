import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../../../../../core/error/exceptions.dart';
import '../../../../../../../core/error/failures.dart';
import '../../../../../../../core/utils/logger.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  
  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await remoteDataSource.login({
        'email': email,
        'password': password,
      });
      
      AppLogger.info('Login successful for: $email');
      
      final userModel = UserModel(
        id: authResponse.data.id,
        email: authResponse.data.email,
        name: authResponse.data.name,
        avatarUrl: authResponse.data.photoUrl,
      );
      
      await localDataSource.saveUser(userModel);
      await localDataSource.saveToken(authResponse.data.token);
      
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      AppLogger.error('Dio error during login', error: e);
      
      // Handle specific HTTP errors
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;
        
        if (statusCode == 404) {
          return const Left(ServerFailure('API endpoint not found'));
        }
        
        if (responseData is Map<String, dynamic>) {
          final message = responseData['message'] as String?;
          return Left(ServerFailure(message ?? 'Login failed'));
        }
      }
      
      return Left(NetworkFailure(e.message ?? 'Network error'));
    } on ServerException catch (e) {
              AppLogger.error('Login failed', error: e);
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
              AppLogger.error('Network error during login', error: e);
      return Left(NetworkFailure(e.message));
    } catch (e) {
      AppLogger.error('Unexpected error during login', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final authResponse = await remoteDataSource.register({
        'email': email,
        'password': password,
        'name': name,
      });
      
      AppLogger.info('Registration successful for: $email');
      
      final userModel = UserModel(
        id: authResponse.data.id,
        email: authResponse.data.email,
        name: authResponse.data.name,
        avatarUrl: authResponse.data.photoUrl,
      );
      
      // Save user and token locally
      await localDataSource.saveUser(userModel);
      await localDataSource.saveToken(authResponse.data.token);
      
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      AppLogger.error('Dio error during registration', error: e);
      
      // Handle specific HTTP errors
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;
        
        if (statusCode == 404) {
          return const Left(ServerFailure('API endpoint not found'));
        }
        
        if (responseData is Map<String, dynamic>) {
          final message = responseData['message'] as String?;
          return Left(ServerFailure(message ?? 'Registration failed'));
        }
      }
      
      return Left(NetworkFailure(e.message ?? 'Network error'));
    } on ServerException catch (e) {
      AppLogger.error('Registration failed', error: e);
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      AppLogger.error('Network error during registration', error: e);
      return Left(NetworkFailure(e.message));
    } catch (e) {
      AppLogger.error('Unexpected error during registration', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearUser();
      AppLogger.info('User logged out successfully');
      return const Right(null);
    } catch (e) {
      AppLogger.error('Unexpected error during logout', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      AppLogger.info('Fetching fresh user profile from API');
      
      // Call API and handle wrapped response manually
      final response = await remoteDataSource.getCurrentUserRaw();
      
      // Extract user data from wrapped response
      final responseMap = response as Map<String, dynamic>;
      final userData = responseMap['data'] as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userData);
      
      await localDataSource.saveUser(userModel);
      
      AppLogger.info('User profile updated successfully: ${userModel.name}');
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      AppLogger.error('Network error getting current user', error: e);
      
      try {
        final cachedUser = await localDataSource.getUser();
        if (cachedUser != null) {
          AppLogger.info('Using cached user profile as fallback');
          return Right(cachedUser.toEntity());
        }
      } catch (_) {}
      
      return Left(NetworkFailure(e.message ?? 'Network error'));
    } on ServerException catch (e) {
      AppLogger.error('Server error getting current user', error: e);
      
   
      try {
        final cachedUser = await localDataSource.getUser();
        if (cachedUser != null) {
          AppLogger.info('Using cached user profile as fallback');
          return Right(cachedUser.toEntity());
        }
      } catch (_) {}
      
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      AppLogger.error('Cache error', error: e);
      return Left(CacheFailure(e.message));
    } catch (e) {
      AppLogger.error('Unexpected error getting current user', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      final token = await localDataSource.getToken();
      return Right(token != null);
    } catch (e) {
      AppLogger.error('Error checking authentication status', error: e);
      return const Right(false);
    }
  }
  
  @override
  Future<Either<Failure, void>> updateProfile({
    required String name,
    String? avatarUrl,
  }) async {
    try {
      final userModel = await remoteDataSource.updateProfile({
        'name': name,
        if (avatarUrl != null) 'avatarUrl': avatarUrl,
      });
      
      await localDataSource.saveUser(userModel);
      
      return const Right(null);
    } on ServerException catch (e) {
      AppLogger.error('Profile update failed', error: e);
      return Left(ServerFailure(e.message));
    } catch (e) {
      AppLogger.error('Unexpected error updating profile', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await remoteDataSource.changePassword({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      });
      
      return const Right(null);
    } on ServerException catch (e) {
      AppLogger.error('Password change failed', error: e);
      return Left(ServerFailure(e.message));
    } catch (e) {
      AppLogger.error('Unexpected error changing password', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> forgotPassword({
    required String email,
  }) async {
    try {
      await remoteDataSource.forgotPassword({
        'email': email,
      });
      
      return const Right(null);
    } on ServerException catch (e) {
      AppLogger.error('Forgot password request failed', error: e);
      return Left(ServerFailure(e.message));
    } catch (e) {
      AppLogger.error('Unexpected error in forgot password', error: e);
      return const Left(UnknownFailure());
    }
  }
} 
