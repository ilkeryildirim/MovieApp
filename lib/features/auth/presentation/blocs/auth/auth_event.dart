part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;
  const factory AuthEvent.register({
    required String email,
    required String password,
    required String name,
  }) = _Register;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.updateUser(User user) = _UpdateUser;
  const factory AuthEvent.updateProfilePhoto(String photoUrl) = _UpdateProfilePhoto;
} 