import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class PhotoUploadRepository {
  Future<Either<Failure, String>> uploadPhoto(File file);
} 