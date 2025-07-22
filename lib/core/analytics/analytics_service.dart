import 'events/analytics_event.dart';

abstract class AnalyticsService {
  String get serviceName;
  bool get isEnabled;
  
  Future<void> initialize();
  Future<void> trackEvent(AnalyticsEvent event);
  Future<void> setUserId(String userId);
  Future<void> setUserProperty(String name, String value);
  Future<void> disable();
  Future<void> enable();
} 