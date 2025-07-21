part of 'photo_upload_bloc.dart';

@freezed
class PhotoUploadState with _$PhotoUploadState {
  const factory PhotoUploadState.initial() = _Initial;
  const factory PhotoUploadState.uploading() = _Uploading;
  const factory PhotoUploadState.success(String photoUrl) = _Success;
  const factory PhotoUploadState.error(String message) = _Error;
} 