// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_local_datasource.dart'
    as _i992;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/blocs/auth/auth_bloc.dart' as _i331;
import '../../features/movie/data/datasources/favorite_local_datasource.dart'
    as _i937;
import '../../features/movie/data/repositories/movie_repository_impl.dart'
    as _i863;
import '../../features/movie/data/services/movie_service.dart' as _i1039;
import '../../features/movie/domain/repositories/movie_repository.dart'
    as _i224;
import '../../features/movie/domain/usecases/get_movies_usecase.dart' as _i536;
import '../../features/movie/domain/usecases/toggle_favorite_usecase.dart'
    as _i211;
import '../../features/movie/presentation/blocs/favorite/favorite_bloc.dart'
    as _i442;
import '../../features/movie/presentation/blocs/movie/movie_bloc.dart' as _i154;
import '../../features/photo_upload/data/datasources/photo_upload_remote_datasource.dart'
    as _i524;
import '../../features/photo_upload/data/repositories/photo_upload_repository_impl.dart'
    as _i340;
import '../../features/photo_upload/domain/repositories/photo_upload_repository.dart'
    as _i544;
import '../../features/photo_upload/domain/usecases/upload_photo_usecase.dart'
    as _i951;
import '../../features/photo_upload/presentation/blocs/photo_upload/photo_upload_bloc.dart'
    as _i713;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i965;
import '../../features/profile/domain/usecases/refresh_profile_usecase.dart'
    as _i306;
import '../../features/profile/presentation/blocs/profile/profile_bloc.dart'
    as _i349;
import '../network/dio_client.dart' as _i667;
import '../router/app_router.dart' as _i81;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => injectionModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
    gh.lazySingleton<_i81.AppRouter>(() => _i81.AppRouter());
    gh.factory<_i992.AuthLocalDataSource>(() => _i992.AuthLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i937.FavoriteLocalDataSource>(() =>
        _i937.FavoriteLocalDataSourceImpl(
            sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => injectionModule.dio(gh<_i667.DioClient>()));
    gh.lazySingleton<_i524.PhotoUploadRemoteDataSource>(
        () => _i524.PhotoUploadRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i1039.MovieService>(
        () => _i1039.MovieService(gh<_i361.Dio>()));
    gh.factory<_i161.AuthRemoteDataSource>(
        () => _i161.AuthRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i544.PhotoUploadRepository>(() =>
        _i340.PhotoUploadRepositoryImpl(
            remoteDataSource: gh<_i524.PhotoUploadRemoteDataSource>()));
    gh.factory<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
          remoteDataSource: gh<_i161.AuthRemoteDataSource>(),
          localDataSource: gh<_i992.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i224.MovieRepository>(() => _i863.MovieRepositoryImpl(
          gh<_i1039.MovieService>(),
          gh<_i937.FavoriteLocalDataSource>(),
        ));
    gh.factory<_i188.LoginUseCase>(
        () => _i188.LoginUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i941.RegisterUseCase>(
        () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i536.GetMoviesUseCase>(
        () => _i536.GetMoviesUseCase(gh<_i224.MovieRepository>()));
    gh.factory<_i211.ToggleFavoriteUseCase>(
        () => _i211.ToggleFavoriteUseCase(gh<_i224.MovieRepository>()));
    gh.factory<_i951.UploadPhotoUseCase>(
        () => _i951.UploadPhotoUseCase(gh<_i544.PhotoUploadRepository>()));
    gh.factory<_i331.AuthBloc>(() => _i331.AuthBloc(
          loginUseCase: gh<_i188.LoginUseCase>(),
          registerUseCase: gh<_i941.RegisterUseCase>(),
          authRepository: gh<_i787.AuthRepository>(),
        ));
    gh.factory<_i894.ProfileRepository>(() => _i334.ProfileRepositoryImpl(
          authRepository: gh<_i787.AuthRepository>(),
          favoriteLocalDataSource: gh<_i937.FavoriteLocalDataSource>(),
        ));
    gh.factory<_i154.MovieBloc>(() => _i154.MovieBloc(
          gh<_i224.MovieRepository>(),
          gh<_i937.FavoriteLocalDataSource>(),
        ));
    gh.lazySingleton<_i442.FavoriteBloc>(() => _i442.FavoriteBloc(
          gh<_i224.MovieRepository>(),
          gh<_i937.FavoriteLocalDataSource>(),
        ));
    gh.factory<_i713.PhotoUploadBloc>(() => _i713.PhotoUploadBloc(
        uploadPhotoUseCase: gh<_i951.UploadPhotoUseCase>()));
    gh.factory<_i965.GetProfileUseCase>(
        () => _i965.GetProfileUseCase(gh<_i894.ProfileRepository>()));
    gh.factory<_i306.RefreshProfileUseCase>(
        () => _i306.RefreshProfileUseCase(gh<_i894.ProfileRepository>()));
    gh.factory<_i349.ProfileBloc>(() => _i349.ProfileBloc(
          getProfileUseCase: gh<_i965.GetProfileUseCase>(),
          refreshProfileUseCase: gh<_i306.RefreshProfileUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i212.InjectionModule {}
