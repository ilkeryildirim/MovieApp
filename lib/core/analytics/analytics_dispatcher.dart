import 'analytics_service.dart';
import 'events/analytics_event.dart';
import 'services/firebase_analytics_service.dart';
import 'services/mixpanel_analytics_service.dart';
import '../utils/logger.dart';

class AnalyticsDispatcher {
  static final AnalyticsDispatcher _instance = AnalyticsDispatcher._internal();
  factory AnalyticsDispatcher() => _instance;
  AnalyticsDispatcher._internal();

  final List<AnalyticsService> _services = [];
  final Map<String, bool> _serviceStates = {};
  bool _globalEnabled = true;

  Future<void> initialize({
    bool enableFirebase = true,
    bool enableMixpanel = true,
  }) async {
    try {
      // Firebase Analytics
      if (enableFirebase) {
        final firebaseService = FirebaseAnalyticsService();
        await firebaseService.initialize();
        _services.add(firebaseService);
        _serviceStates[firebaseService.serviceName] = true;
      }

      // Mixpanel Analytics
      if (enableMixpanel) {
        final mixpanelService = MixpanelAnalyticsService();
        await mixpanelService.initialize();
        _services.add(mixpanelService);
        _serviceStates[mixpanelService.serviceName] = true;
      }

      AppLogger.info('AnalyticsDispatcher initialized with ${_services.length} services');
    } catch (e) {
      AppLogger.error('Failed to initialize AnalyticsDispatcher: $e');
    }
  }

  Future<void> trackEvent(AnalyticsEvent event) async {
    if (!_globalEnabled) {
      AppLogger.info('Analytics globally disabled, skipping event: ${event.eventName}');
      return;
    }

    final futures = <Future>[];
    
    for (final service in _services) {
      if (service.isEnabled && (_serviceStates[service.serviceName] ?? false)) {
        futures.add(service.trackEvent(event));
      }
    }

    if (futures.isNotEmpty) {
      await Future.wait(futures);
      AppLogger.info('Event ${event.eventName} sent to ${futures.length} services');
    } else {
      AppLogger.warning('No active analytics services for event: ${event.eventName}');
    }
  }

  Future<void> setUserId(String userId) async {
    if (!_globalEnabled) return;

    final futures = _services
        .where((service) => service.isEnabled && (_serviceStates[service.serviceName] ?? false))
        .map((service) => service.setUserId(userId));

    await Future.wait(futures);
    AppLogger.info('User ID set to $userId across ${futures.length} services');
  }

  Future<void> setUserProperty(String name, String value) async {
    if (!_globalEnabled) return;

    final futures = _services
        .where((service) => service.isEnabled && (_serviceStates[service.serviceName] ?? false))
        .map((service) => service.setUserProperty(name, value));

    await Future.wait(futures);
    AppLogger.info('User property $name:$value set across ${futures.length} services');
  }

  Future<void> toggleService(String serviceName, bool enabled) async {
    _serviceStates[serviceName] = enabled;
    
    final service = _services.firstWhere(
      (s) => s.serviceName == serviceName,
      orElse: () => throw ArgumentError('Service $serviceName not found'),
    );

    if (enabled) {
      await service.enable();
    } else {
      await service.disable();
    }

    AppLogger.info('Service $serviceName ${enabled ? 'enabled' : 'disabled'}');
  }

  Future<void> setGlobalEnabled(bool enabled) async {
    _globalEnabled = enabled;
    
    final futures = <Future>[];
    for (final service in _services) {
      if (enabled) {
        futures.add(service.enable());
      } else {
        futures.add(service.disable());
      }
    }
    
    await Future.wait(futures);
    AppLogger.info('Analytics globally ${enabled ? 'enabled' : 'disabled'}');
  }

  List<String> getActiveServices() {
    return _services
        .where((service) => service.isEnabled && (_serviceStates[service.serviceName] ?? false))
        .map((service) => service.serviceName)
        .toList();
  }

  Map<String, bool> getServiceStates() {
    final states = <String, bool>{};
    for (final service in _services) {
      states[service.serviceName] = service.isEnabled && (_serviceStates[service.serviceName] ?? false);
    }
    return states;
  }

  bool get isGloballyEnabled => _globalEnabled;

  Future<void> addService(AnalyticsService service) async {
    await service.initialize();
    _services.add(service);
    _serviceStates[service.serviceName] = true;
    AppLogger.info('Added new analytics service: ${service.serviceName}');
  }

  Future<void> removeService(String serviceName) async {
    final service = _services.firstWhere(
      (s) => s.serviceName == serviceName,
      orElse: () => throw ArgumentError('Service $serviceName not found'),
    );

    await service.disable();
    _services.remove(service);
    _serviceStates.remove(serviceName);
    AppLogger.info('Removed analytics service: $serviceName');
  }
} 