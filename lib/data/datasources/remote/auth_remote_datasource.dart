import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/user_model.dart';

part 'auth_remote_datasource.g.dart';

@RestApi()
@injectable
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;
  
  @POST('/auth/login')
  Future<UserModel> login(@Body() Map<String, dynamic> body);
  
  @POST('/auth/register')
  Future<UserModel> register(@Body() Map<String, dynamic> body);
  
  @POST('/auth/logout')
  Future<void> logout();
  
  @GET('/auth/me')
  Future<UserModel> getCurrentUser();
  
  @PUT('/auth/profile')
  Future<UserModel> updateProfile(@Body() Map<String, dynamic> body);
  
  @POST('/auth/change-password')
  Future<void> changePassword(@Body() Map<String, dynamic> body);
  
  @POST('/auth/forgot-password')
  Future<void> forgotPassword(@Body() Map<String, dynamic> body);
} 