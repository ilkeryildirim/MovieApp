import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_upload_response_model.freezed.dart';
part 'photo_upload_response_model.g.dart';

@freezed
class PhotoUploadResponseModel with _$PhotoUploadResponseModel {
  const factory PhotoUploadResponseModel({
    required String photoUrl,
  }) = _PhotoUploadResponseModel;

  factory PhotoUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoUploadResponseModelFromJson(json);
} 