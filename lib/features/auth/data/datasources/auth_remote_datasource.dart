import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user_model.dart';
import '../models/auth_response_model.dart';
import '../../../../core/constants/api_constants.dart';

part 'auth_remote_datasource.g.dart';

@RestApi()
@injectable
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;
  
  @POST(ApiConstants.loginEndpoint)
  Future<AuthResponseModel> login(@Body() Map<String, dynamic> body);
  
  @POST(ApiConstants.registerEndpoint)
  Future<AuthResponseModel> register(@Body() Map<String, dynamic> body);
  
  @POST(ApiConstants.logoutEndpoint)
  Future<void> logout();
  
  @GET(ApiConstants.profileEndpoint)
  Future<dynamic> getCurrentUserRaw();

  @PUT(ApiConstants.profileEndpoint)
  Future<UserModel> updateProfile(@Body() Map<String, dynamic> body);
/*
  @POST(ApiConstants.changePasswordEndpoint)
  Future<void> changePassword(@Body() Map<String, dynamic> body);
  
  @POST(ApiConstants.forgotPasswordEndpoint)
  Future<void> forgotPassword(@Body() Map<String, dynamic> body);
   */
} 