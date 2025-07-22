import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/constants/api_constants.dart';
import '../../constants/photo_upload_constants.dart';

part 'photo_upload_remote_datasource.g.dart';

abstract class PhotoUploadRemoteDataSource {
  Future<String> uploadPhoto(File file);
}

@RestApi()
abstract class PhotoUploadApi {
  @factoryMethod
  factory PhotoUploadApi(Dio dio) = _PhotoUploadApi;
  
  @POST(ApiConstants.photoUploadEndpoint)
  Future<dynamic> uploadPhotoRaw(@Body() FormData formData);
}

@LazySingleton(as: PhotoUploadRemoteDataSource)
class PhotoUploadRemoteDataSourceImpl implements PhotoUploadRemoteDataSource {
  final PhotoUploadApi _api;

  PhotoUploadRemoteDataSourceImpl(Dio dio) : _api = PhotoUploadApi(dio);

  @override

  Future<String> uploadPhoto(File file) async {
    try {
      AppLogger.info('Uploading photo: ${file.path}');
      
      final fileName = file.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final response = await _api.uploadPhotoRaw(formData);
      final responseData = response as Map<String, dynamic>;
      
      AppLogger.info('Photo upload response: $responseData');
      
      try {
        String photoUrl;
        
        if (responseData.containsKey('photoUrl')) {
          photoUrl = responseData['photoUrl'] as String;
        } 
        else if (responseData.containsKey('data') && 
                 responseData['data'] is Map<String, dynamic>) {
          final data = responseData['data'] as Map<String, dynamic>;
          photoUrl = data['photoUrl'] as String;
        }
        else if (responseData.containsKey('url')) {
          photoUrl = responseData['url'] as String;
        }
        else {
          photoUrl = responseData.toString();
        }
        
        AppLogger.info('Photo uploaded successfully: $photoUrl');
        return photoUrl;
      } catch (e) {
        AppLogger.error('Error parsing photo upload response', error: e);
        throw ServerException(
          'Invalid response format',
          'PARSING_ERROR',
        );
      }
    } on DioException catch (e) {
      AppLogger.error('Photo upload failed', error: e);
      throw ServerException(
        e.response?.data['message'] ?? 'Failed to upload photo',
        e.response?.statusCode?.toString() ?? 'UNKNOWN',
      );
    } catch (e) {
      AppLogger.error('Unexpected error during photo upload', error: e);
      throw ServerException(
        e.toString(),
        'UNKNOWN',
      );
    }
  }
} 