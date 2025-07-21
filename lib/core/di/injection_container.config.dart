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
import 'package:flutter_base_app/data/datasources/local/auth_local_datasource.dart'
    as _i671;
import 'package:flutter_base_app/data/datasources/local/favorite_local_datasource.dart'
    as _i530;
import 'package:flutter_base_app/data/datasources/remote/auth_remote_datasource.dart'
    as _i575;
import 'package:flutter_base_app/data/repositories/auth_repository_impl.dart'
    as _i325;
import 'package:flutter_base_app/data/repositories/movie_repository_impl.dart'
    as _i267;
import 'package:flutter_base_app/data/services/movie_service.dart' as _i271;
import 'package:flutter_base_app/domain/repositories/auth_repository.dart'
    as _i28;
import 'package:flutter_base_app/domain/repositories/movie_repository.dart'
    as _i541;
import 'package:flutter_base_app/domain/usecases/auth/login_usecase.dart'
    as _i50;
import 'package:flutter_base_app/domain/usecases/auth/register_usecase.dart'
    as _i290;
import 'package:flutter_base_app/presentation/blocs/auth/auth_bloc.dart'
    as _i102;
import 'package:flutter_base_app/presentation/blocs/favorite/favorite_bloc.dart'
    as _i317;
import 'package:flutter_base_app/presentation/blocs/movie/movie_bloc.dart'
    as _i863;
import 'package:flutter_base_app/presentation/router/app_router.dart' as _i351;
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
    gh.lazySingleton<_i351.AppRouter>(() => _i351.AppRouter());
    gh.factory<_i671.AuthLocalDataSource>(() => _i671.AuthLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i530.FavoriteLocalDataSource>(() =>
        _i530.FavoriteLocalDataSourceImpl(
            sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => injectionModule.dio(gh<_i985.DioClient>()));
    gh.factory<_i575.AuthRemoteDataSource>(
        () => _i575.AuthRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i271.MovieService>(
        () => _i271.MovieService(gh<_i361.Dio>()));
    gh.lazySingleton<_i541.MovieRepository>(() => _i267.MovieRepositoryImpl(
          gh<_i271.MovieService>(),
          gh<_i530.FavoriteLocalDataSource>(),
        ));
    gh.lazySingleton<_i317.FavoriteBloc>(() => _i317.FavoriteBloc(
          gh<_i541.MovieRepository>(),
          gh<_i530.FavoriteLocalDataSource>(),
        ));
    gh.factory<_i863.MovieBloc>(() => _i863.MovieBloc(
          gh<_i541.MovieRepository>(),
          gh<_i530.FavoriteLocalDataSource>(),
        ));
    gh.factory<_i28.AuthRepository>(() => _i325.AuthRepositoryImpl(
          remoteDataSource: gh<_i575.AuthRemoteDataSource>(),
          localDataSource: gh<_i671.AuthLocalDataSource>(),
        ));
    gh.factory<_i50.LoginUseCase>(
        () => _i50.LoginUseCase(gh<_i28.AuthRepository>()));
    gh.factory<_i290.RegisterUseCase>(
        () => _i290.RegisterUseCase(gh<_i28.AuthRepository>()));
    gh.factory<_i102.AuthBloc>(() => _i102.AuthBloc(
          loginUseCase: gh<_i50.LoginUseCase>(),
          registerUseCase: gh<_i290.RegisterUseCase>(),
          authRepository: gh<_i28.AuthRepository>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i851.InjectionModule {}
