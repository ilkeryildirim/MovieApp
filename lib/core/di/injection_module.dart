import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../network/dio_client.dart';
 
@module
abstract class InjectionModule {
  @lazySingleton
  Dio dio(DioClient dioClient) => dioClient.dio;
} 