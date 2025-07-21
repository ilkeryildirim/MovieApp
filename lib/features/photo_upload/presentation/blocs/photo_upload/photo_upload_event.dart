part of 'photo_upload_bloc.dart';

@freezed
class PhotoUploadEvent with _$PhotoUploadEvent {
  const factory PhotoUploadEvent.uploadPhoto(File file) = _UploadPhoto;
  const factory PhotoUploadEvent.reset() = _Reset;
} 