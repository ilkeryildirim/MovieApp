import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/utils/logger.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_datasource.dart';
import '../datasources/remote/auth_remote_datasource.dart';
import '../models/user_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final AppLogger logger;
  
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.logger,
  });
  
  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      // MOCK LOGIN - Remove this in production!
      // For development purposes, allow these test credentials:
      if (_isValidTestCredentials(email, password)) {
        final now = DateTime.now();
        final mockUser = UserModel(
          id: '1',
          name: _getMockUserName(email),
          email: email,
          avatarUrl: null,
          createdAt: now,
          updatedAt: now,
        );
        
        // Save mock user and token locally
        await localDataSource.saveUser(mockUser);
        await localDataSource.saveToken('mock_token_${DateTime.now().millisecondsSinceEpoch}');
        
        logger.info('Mock login successful for: $email');
        return Right(mockUser.toEntity());
      }
      
      // If not mock credentials, try real API
      final userModel = await remoteDataSource.login({
        'email': email,
        'password': password,
      });
      
      // Save user and token locally
      await localDataSource.saveUser(userModel);
      
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      logger.error('Login failed', error: e);
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      logger.error('Network error during login', error: e);
      return Left(NetworkFailure(e.message));
    } catch (e) {
      logger.error('Unexpected error during login', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  // MOCK LOGIN HELPERS - Remove in production!
  bool _isValidTestCredentials(String email, String password) {
    const validCredentials = {
      'admin@test.com': 'admin123',
      'user@test.com': 'user123',
      'demo@demo.com': 'demo123',
      'test@example.com': 'test123',
    };
    
    return validCredentials[email.toLowerCase()] == password;
  }
  
  String _getMockUserName(String email) {
    const userNames = {
      'admin@test.com': 'Admin User',
      'user@test.com': 'Test User',
      'demo@demo.com': 'Demo User',
      'test@example.com': 'Example User',
    };
    
    return userNames[email.toLowerCase()] ?? 'Test User';
  }
  
  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userModel = await remoteDataSource.register({
        'email': email,
        'password': password,
        'name': name,
      });
      
      // Save user locally
      await localDataSource.saveUser(userModel);
      
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      logger.error('Registration failed', error: e);
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      logger.error('Network error during registration', error: e);
      return Left(NetworkFailure(e.message));
    } catch (e) {
      logger.error('Unexpected error during registration', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.clearUser();
      return const Right(null);
    } on ServerException catch (e) {
      logger.error('Logout failed', error: e);
      return Left(ServerFailure(e.message));
    } catch (e) {
      logger.error('Unexpected error during logout', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      // Try to get from cache first
      final cachedUser = await localDataSource.getUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }
      
      // If not in cache, fetch from remote
      final userModel = await remoteDataSource.getCurrentUser();
      await localDataSource.saveUser(userModel);
      
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      logger.error('Failed to get current user', error: e);
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      logger.error('Cache error', error: e);
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.error('Unexpected error getting current user', error: e);
      return const Left(UnknownFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      final token = await localDataSource.getToken();
      return Right(token != null);
    } catch (e) {
      logger.error('Error checking authentication status', error: e);
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
      logger.error('Profile update failed', error: e);
      return Left(ServerFailure(e.message));
    } catch (e) {
      logger.error('Unexpected error updating profile', error: e);
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
      logger.error('Password change failed', error: e);
      return Left(ServerFailure(e.message));
    } catch (e) {
      logger.error('Unexpected error changing password', error: e);
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
      logger.error('Forgot password request failed', error: e);
      return Left(ServerFailure(e.message));
    } catch (e) {
      logger.error('Unexpected error in forgot password', error: e);
      return const Left(UnknownFailure());
    }
  }
} 