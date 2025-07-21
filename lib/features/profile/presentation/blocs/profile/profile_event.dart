part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = _LoadProfile;
  const factory ProfileEvent.refreshProfile() = _RefreshProfile;
  const factory ProfileEvent.updateProfilePhoto(String photoUrl) = _UpdateProfilePhoto;
} 