import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/utils/logger.dart';
import '../../../domain/entities/profile.dart';
import '../../../domain/usecases/get_profile_usecase.dart';
import '../../../domain/usecases/refresh_profile_usecase.dart';
import '../../../../../../domain/usecases/base/usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final RefreshProfileUseCase refreshProfileUseCase;

  ProfileBloc({
    required this.getProfileUseCase,
    required this.refreshProfileUseCase,
  }) : super(const ProfileState.initial()) {
    on<_LoadProfile>(_onLoadProfile);
    on<_RefreshProfile>(_onRefreshProfile);
    on<_UpdateProfilePhoto>(_onUpdateProfilePhoto);
  }

  Future<void> _onLoadProfile(
    _LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await getProfileUseCase(const NoParams());

    result.fold(
      (failure) {
        AppLogger.error('Failed to load profile', error: failure);
        emit(ProfileState.error(failure.message));
      },
      (profile) {
        AppLogger.info('Profile loaded successfully');
        emit(ProfileState.loaded(profile));
      },
    );
  }

  Future<void> _onRefreshProfile(
    _RefreshProfile event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    
    // Keep current data while refreshing
    if (currentState is _Loaded) {
      emit(ProfileState.loaded(
        currentState.profile.copyWith(isLoading: true),
      ));
    } else {
      emit(const ProfileState.loading());
    }

    final result = await refreshProfileUseCase(const NoParams());

    result.fold(
      (failure) {
        AppLogger.error('Failed to refresh profile', error: failure);
        if (currentState is _Loaded) {
          // Keep current data on refresh error
          emit(ProfileState.loaded(
            currentState.profile.copyWith(
              isLoading: false,
              error: failure.message,
            ),
          ));
        } else {
          emit(ProfileState.error(failure.message));
        }
      },
      (profile) {
        AppLogger.info('Profile refreshed successfully');
        emit(ProfileState.loaded(profile));
      },
    );
  }

  Future<void> _onUpdateProfilePhoto(
    _UpdateProfilePhoto event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    
    if (currentState is _Loaded) {
      final updatedUser = currentState.profile.user.copyWith(
        avatarUrl: event.photoUrl,
      );
      
      final updatedProfile = currentState.profile.copyWith(
        user: updatedUser,
      );
      
      emit(ProfileState.loaded(updatedProfile));
      AppLogger.info('Profile photo updated in profile bloc');
    }
  }
} 