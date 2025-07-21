import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../constants/photo_upload_constants.dart';
import '../models/photo_upload_response_model.dart';

abstract class PhotoUploadRemoteDataSource {
  Future<String> uploadPhoto(File file);
}

@LazySingleton(as: PhotoUploadRemoteDataSource)
class PhotoUploadRemoteDataSourceImpl implements PhotoUploadRemoteDataSource {
  final DioClient _dioClient;

  PhotoUploadRemoteDataSourceImpl(this._dioClient);

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

      final response = await _dioClient.dio.post(
        PhotoUploadConstants.uploadEndpoint,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      if (response.statusCode == 200) {
        AppLogger.info('Photo upload response: ${response.data}');
        
        try {
          final responseData = response.data;
          String photoUrl;
          
          if (responseData is Map<String, dynamic>) {
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
          } else {
            photoUrl = responseData.toString();
          }
          
          AppLogger.info('Photo uploaded successfully: $photoUrl');
          return photoUrl;
        } catch (e) {
          AppLogger.error('Error parsing photo upload response', error: e);
          throw ServerException(
            'Invalid response format',
            response.statusCode.toString(),
          );
        }
      } else {
        throw ServerException(
          'Failed to upload photo',
          response.statusCode.toString(),
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