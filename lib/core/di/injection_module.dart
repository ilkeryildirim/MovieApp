import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/dio_client.dart';
 
@module
abstract class InjectionModule {
  @lazySingleton
  Dio dio(DioClient dioClient) => dioClient.dio;
  
  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
} 