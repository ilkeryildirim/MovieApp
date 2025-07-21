// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_base_app/core/di/injection_module.dart' as _i851;
import 'package:flutter_base_app/core/network/dio_client.dart' as _i985;
import 'package:flutter_base_app/core/router/app_router.dart' as _i489;
import 'package:flutter_base_app/features/auth/data/datasources/auth_local_datasource.dart'
    as _i463;
import 'package:flutter_base_app/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i898;
import 'package:flutter_base_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i109;
import 'package:flutter_base_app/features/auth/domain/repositories/auth_repository.dart'
    as _i746;
import 'package:flutter_base_app/features/auth/domain/usecases/login_usecase.dart'
    as _i995;
import 'package:flutter_base_app/features/auth/domain/usecases/register_usecase.dart'
    as _i513;
import 'package:flutter_base_app/features/auth/presentation/blocs/auth/auth_bloc.dart'
    as _i501;
import 'package:flutter_base_app/features/movie/data/datasources/favorite_local_datasource.dart'
    as _i79;
import 'package:flutter_base_app/features/movie/data/repositories/movie_repository_impl.dart'
    as _i440;
import 'package:flutter_base_app/features/movie/data/services/movie_service.dart'
    as _i140;
import 'package:flutter_base_app/features/movie/domain/repositories/movie_repository.dart'
    as _i574;
import 'package:flutter_base_app/features/movie/domain/usecases/get_movies_usecase.dart'
    as _i1050;
import 'package:flutter_base_app/features/movie/domain/usecases/toggle_favorite_usecase.dart'
    as _i221;
import 'package:flutter_base_app/features/movie/presentation/blocs/favorite/favorite_bloc.dart'
    as _i798;
import 'package:flutter_base_app/features/movie/presentation/blocs/movie/movie_bloc.dart'
    as _i58;
import 'package:flutter_base_app/features/profile/presentation/view_models/profile_view_model.dart'
    as _i356;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    gh.lazySingleton<_i985.DioClient>(() => _i985.DioClient());
    gh.lazySingleton<_i489.AppRouter>(() => _i489.AppRouter());
    gh.factory<_i463.AuthLocalDataSource>(() => _i463.AuthLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i79.FavoriteLocalDataSource>(() =>
        _i79.FavoriteLocalDataSourceImpl(
            sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => injectionModule.dio(gh<_i985.DioClient>()));
    gh.factory<_i898.AuthRemoteDataSource>(
        () => _i898.AuthRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i140.MovieService>(
        () => _i140.MovieService(gh<_i361.Dio>()));
    gh.factory<_i746.AuthRepository>(() => _i109.AuthRepositoryImpl(
          remoteDataSource: gh<_i898.AuthRemoteDataSource>(),
          localDataSource: gh<_i463.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i574.MovieRepository>(() => _i440.MovieRepositoryImpl(
          gh<_i140.MovieService>(),
          gh<_i79.FavoriteLocalDataSource>(),
        ));
    gh.factory<_i995.LoginUseCase>(
        () => _i995.LoginUseCase(gh<_i746.AuthRepository>()));
    gh.factory<_i513.RegisterUseCase>(
        () => _i513.RegisterUseCase(gh<_i746.AuthRepository>()));
    gh.factory<_i1050.GetMoviesUseCase>(
        () => _i1050.GetMoviesUseCase(gh<_i574.MovieRepository>()));
    gh.factory<_i221.ToggleFavoriteUseCase>(
        () => _i221.ToggleFavoriteUseCase(gh<_i574.MovieRepository>()));
    gh.factory<_i501.AuthBloc>(() => _i501.AuthBloc(
          loginUseCase: gh<_i995.LoginUseCase>(),
          registerUseCase: gh<_i513.RegisterUseCase>(),
          authRepository: gh<_i746.AuthRepository>(),
        ));
    gh.factory<_i58.MovieBloc>(() => _i58.MovieBloc(
          gh<_i574.MovieRepository>(),
          gh<_i79.FavoriteLocalDataSource>(),
        ));
    gh.lazySingleton<_i798.FavoriteBloc>(() => _i798.FavoriteBloc(
          gh<_i574.MovieRepository>(),
          gh<_i79.FavoriteLocalDataSource>(),
        ));
    gh.factory<_i356.ProfileViewModel>(() => _i356.ProfileViewModel(
          authRepository: gh<_i746.AuthRepository>(),
          favoriteBloc: gh<_i798.FavoriteBloc>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i851.InjectionModule {}
