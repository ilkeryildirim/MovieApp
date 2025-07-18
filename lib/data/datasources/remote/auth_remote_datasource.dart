import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/user_model.dart';
import '../../models/auth_response_model.dart';

part 'auth_remote_datasource.g.dart';

@RestApi()
@injectable
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;
  
  @POST('user/login')
  Future<AuthResponseModel> login(@Body() Map<String, dynamic> body);
  
  @POST('user/register')
  Future<AuthResponseModel> register(@Body() Map<String, dynamic> body);
  
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