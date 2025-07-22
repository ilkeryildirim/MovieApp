import 'analytics_event.dart';

class ScreenViewEvent extends AnalyticsEvent {
  final String screenName;
  final String screenClass;
  final String? previousScreen;
  final Duration? sessionDuration;
  
  ScreenViewEvent({
    required this.screenName,
    required this.screenClass,
    this.previousScreen,
    this.sessionDuration,
  });
  
  @override
  String get eventName => 'screen_view';
  
  @override
  Map<String, dynamic> get parameters => {
    'screen_name': screenName,
    'screen_class': screenClass,
    if (previousScreen != null) 'previous_screen': previousScreen,
    if (sessionDuration != null) 'session_duration_ms': sessionDuration!.inMilliseconds,
    'timestamp': timestamp.toIso8601String(),
  };
}

class ButtonClickEvent extends AnalyticsEvent {
  final String buttonName;
  final String screenName;
  final String? buttonType;
  final Map<String, dynamic>? additionalData;
  
  ButtonClickEvent({
    required this.buttonName,
    required this.screenName,
    this.buttonType,
    this.additionalData,
  });
  
  @override
  String get eventName => 'button_click';
  
  @override
  Map<String, dynamic> get parameters => {
    'button_name': buttonName,
    'screen_name': screenName,
    if (buttonType != null) 'button_type': buttonType,
    if (additionalData != null) ...additionalData!,
    'timestamp': timestamp.toIso8601String(),
  };
}

class FeatureUsageEvent extends AnalyticsEvent {
  final String featureName;
  final String action;
  final String screenName;
  final Map<String, dynamic>? metadata;
  
  FeatureUsageEvent({
    required this.featureName,
    required this.action,
    required this.screenName,
    this.metadata,
  });
  
  @override
  String get eventName => 'feature_usage';
  
  @override
  Map<String, dynamic> get parameters => {
    'feature_name': featureName,
    'action': action,
    'screen_name': screenName,
    if (metadata != null) ...metadata!,
    'timestamp': timestamp.toIso8601String(),
  };
} 