import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/upload_photo_usecase.dart';

part 'photo_upload_event.dart';
part 'photo_upload_state.dart';
part 'photo_upload_bloc.freezed.dart';

@injectable
class PhotoUploadBloc extends Bloc<PhotoUploadEvent, PhotoUploadState> {
  final UploadPhotoUseCase _uploadPhotoUseCase;

  PhotoUploadBloc({
    required UploadPhotoUseCase uploadPhotoUseCase,
  })  : _uploadPhotoUseCase = uploadPhotoUseCase,
        super(const PhotoUploadState.initial()) {
    on<_UploadPhoto>(_onUploadPhoto);
    on<_Reset>(_onReset);
  }

  Future<void> _onUploadPhoto(
    _UploadPhoto event,
    Emitter<PhotoUploadState> emit,
  ) async {
    emit(const PhotoUploadState.uploading());

    final result = await _uploadPhotoUseCase(
      UploadPhotoParams(file: event.file),
    );

    result.fold(
      (failure) => emit(PhotoUploadState.error(failure.message)),
      (photoUrl) => emit(PhotoUploadState.success(photoUrl)),
    );
  }

  void _onReset(
    _Reset event,
    Emitter<PhotoUploadState> emit,
  ) {
    emit(const PhotoUploadState.initial());
  }
} 