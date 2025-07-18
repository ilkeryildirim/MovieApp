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

import '../../data/datasources/local/auth_local_datasource.dart' as _i17;
import '../../data/datasources/remote/auth_remote_datasource.dart' as _i1057;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/usecases/auth/login_usecase.dart' as _i461;
import '../../domain/usecases/auth/register_usecase.dart' as _i659;
import '../../presentation/blocs/auth/auth_bloc.dart' as _i141;
import '../../presentation/router/app_router.dart' as _i127;
import '../network/dio_client.dart' as _i667;
import '../utils/logger.dart' as _i221;
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
    gh.lazySingleton<_i221.AppLogger>(() => _i221.AppLogger());
    gh.lazySingleton<_i127.AppRouter>(() => _i127.AppRouter());
    gh.factory<_i17.AuthLocalDataSource>(() => _i17.AuthLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => injectionModule.dio(gh<_i667.DioClient>()));
    gh.factory<_i1057.AuthRemoteDataSource>(
        () => _i1057.AuthRemoteDataSource(gh<_i361.Dio>()));
    gh.factory<_i1073.AuthRepository>(() => _i895.AuthRepositoryImpl(
          remoteDataSource: gh<_i1057.AuthRemoteDataSource>(),
          localDataSource: gh<_i17.AuthLocalDataSource>(),
          logger: gh<_i221.AppLogger>(),
        ));
    gh.factory<_i461.LoginUseCase>(
        () => _i461.LoginUseCase(gh<_i1073.AuthRepository>()));
    gh.factory<_i659.RegisterUseCase>(
        () => _i659.RegisterUseCase(gh<_i1073.AuthRepository>()));
    gh.factory<_i141.AuthBloc>(() => _i141.AuthBloc(
          loginUseCase: gh<_i461.LoginUseCase>(),
          registerUseCase: gh<_i659.RegisterUseCase>(),
          authRepository: gh<_i1073.AuthRepository>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i212.InjectionModule {}
