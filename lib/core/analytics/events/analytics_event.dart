abstract class AnalyticsEvent {
  String get eventName;
  Map<String, dynamic> get parameters;
  DateTime get timestamp => DateTime.now();
  
  @override
  String toString() => 'AnalyticsEvent{name: $eventName, parameters: $parameters}';
} 