import 'analytics_event.dart';

class UserLoginEvent extends AnalyticsEvent {
  final String method;
  final String? userId;
  
  UserLoginEvent({required this.method, this.userId});
  
  @override
  String get eventName => 'user_login';
  
  @override
  Map<String, dynamic> get parameters => {
    'method': method,
    if (userId != null) 'user_id': userId,
    'timestamp': timestamp.toIso8601String(),
  };
}

class UserSignUpEvent extends AnalyticsEvent {
  final String method;
  final String? userId;
  
  UserSignUpEvent({required this.method, this.userId});
  
  @override
  String get eventName => 'user_sign_up';
  
  @override
  Map<String, dynamic> get parameters => {
    'method': method,
    if (userId != null) 'user_id': userId,
    'timestamp': timestamp.toIso8601String(),
  };
}

class UserProfileUpdateEvent extends AnalyticsEvent {
  final String userId;
  final List<String> updatedFields;
  
  UserProfileUpdateEvent({required this.userId, required this.updatedFields});
  
  @override
  String get eventName => 'user_profile_update';
  
  @override
  Map<String, dynamic> get parameters => {
    'user_id': userId,
    'updated_fields': updatedFields.join(','),
    'field_count': updatedFields.length,
    'timestamp': timestamp.toIso8601String(),
  };
} 