import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/repositories/photo_upload_repository.dart';
import '../datasources/photo_upload_remote_datasource.dart';

@LazySingleton(as: PhotoUploadRepository)
class PhotoUploadRepositoryImpl implements PhotoUploadRepository {
  final PhotoUploadRemoteDataSource remoteDataSource;

  PhotoUploadRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, String>> uploadPhoto(File file) async {
    try {
      final photoUrl = await remoteDataSource.uploadPhoto(file);
      return Right(photoUrl);
            } on ServerException catch (e) {
          AppLogger.error('Server error during photo upload', error: e);
          return Left(ServerFailure(e.message));
        } catch (e) {
          AppLogger.error('Unexpected error during photo upload', error: e);
          return const Left(ServerFailure('Failed to upload photo'));
    }
  }
} 