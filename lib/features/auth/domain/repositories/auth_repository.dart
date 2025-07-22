import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
  });
  
  Future<Either<Failure, void>> logout();
  
  Future<Either<Failure, User>> getCurrentUser();
  
  Future<Either<Failure, bool>> isAuthenticated();
  
  Future<Either<Failure, void>> updateProfile({
    required String name,
    String? avatarUrl,
  });
  /*
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  
  Future<Either<Failure, void>> forgotPassword({
    required String email,
  });
   */
} 