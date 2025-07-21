import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../core/constants/app_constants.dart';
import '../../../../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> clearUser();
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  
  const AuthLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  
  @override
  Future<void> saveUser(UserModel user) async {
    try {
      final userJson = json.encode(user.toJson());
      final result = await sharedPreferences.setString(
        AppConstants.userKey,
        userJson,
      );
      if (!result) {
        throw const CacheException('Failed to save user');
      }
    } catch (e) {
      throw const CacheException('Failed to save user');
    }
  }
  
  @override
  Future<UserModel?> getUser() async {
    try {
      final userJson = sharedPreferences.getString(AppConstants.userKey);
      if (userJson == null) return null;
      
      final userMap = json.decode(userJson) as Map<String, dynamic>;
      return UserModel.fromJson(userMap);
    } catch (e) {
      throw const CacheException('Failed to get user');
    }
  }
  
  @override
  Future<void> clearUser() async {
    try {
      await Future.wait([
        sharedPreferences.remove(AppConstants.userKey),
        sharedPreferences.remove(AppConstants.authTokenKey),
      ]);
    } catch (e) {
      throw const CacheException('Failed to clear user');
    }
  }
  
  @override
  Future<void> saveToken(String token) async {
    try {
      final result = await sharedPreferences.setString(
        AppConstants.authTokenKey,
        token,
      );
      if (!result) {
        throw const CacheException('Failed to save token');
      }
    } catch (e) {
      throw const CacheException('Failed to save token');
    }
  }
  
  @override
  Future<String?> getToken() async {
    try {
      return sharedPreferences.getString(AppConstants.authTokenKey);
    } catch (e) {
      throw const CacheException('Failed to get token');
    }
  }
  
  @override
  Future<void> clearToken() async {
    try {
      await sharedPreferences.remove(AppConstants.authTokenKey);
    } catch (e) {
      throw const CacheException('Failed to clear token');
    }
  }
} 