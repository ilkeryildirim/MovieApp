import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import '../analytics_service.dart';
import '../events/analytics_event.dart';
import '../events/user_events.dart';
import '../events/screen_events.dart';
import '../events/purchase_events.dart';
import '../../utils/logger.dart';

class MixpanelAnalyticsService implements AnalyticsService {
  static final MixpanelAnalyticsService _instance = MixpanelAnalyticsService._internal();
  factory MixpanelAnalyticsService() => _instance;
  MixpanelAnalyticsService._internal();

  Mixpanel? _mixpanel;
  bool _isEnabled = true;
  static const String _projectToken = 'TOKEN';

  @override
  String get serviceName => 'Mixpanel Analytics';

  @override
  bool get isEnabled => _isEnabled;

  @override
  Future<void> initialize() async {
    try {
      _mixpanel = await Mixpanel.init(_projectToken, trackAutomaticEvents: true);
      AppLogger.info('$serviceName initialized successfully');
    } catch (e) {
      AppLogger.error('Failed to initialize $serviceName: $e');
    }
  }

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    if (!_isEnabled || _mixpanel == null) return;
    
    try {
      await _sendToMixpanel(event);
      AppLogger.info('$serviceName: Event tracked - ${event.eventName}');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to track event ${event.eventName}: $e');
    }
  }

  Future<void> _sendToMixpanel(AnalyticsEvent event) async {
    if (_mixpanel == null) return;

    final Map<String, dynamic> properties = {
      ...event.parameters,
      'service': serviceName,
      'event_type': event.runtimeType.toString(),
    };

    if (event is UserLoginEvent) {
      _mixpanel!.track('Login', properties: properties);
      if (event.userId != null) {
        _mixpanel!.identify(event.userId!);
      }
      AppLogger.info('$serviceName: Login event - ${event.method}');
    } else if (event is UserSignUpEvent) {
      _mixpanel!.track('Sign Up', properties: properties);
      if (event.userId != null) {
        _mixpanel!.identify(event.userId!);
      }
      AppLogger.info('$serviceName: Sign up event - ${event.method}');
    } else if (event is ScreenViewEvent) {
      _mixpanel!.track('Screen View', properties: properties);
      AppLogger.info('$serviceName: Screen view event - ${event.screenName}');
    } else if (event is PurchaseEvent) {
      _mixpanel!.track('Purchase', properties: properties);
      _mixpanel!.getPeople().trackCharge(event.value, properties: properties);
      AppLogger.info('$serviceName: Purchase event - ${event.transactionId}');
    } else if (event is ButtonClickEvent) {
      _mixpanel!.track('Button Click', properties: properties);
      AppLogger.info('$serviceName: Button click event - ${event.buttonName}');
    } else if (event is FeatureUsageEvent) {
      _mixpanel!.track('Feature Usage', properties: properties);
      AppLogger.info('$serviceName: Feature usage event - ${event.featureName}');
    } else {
      // Genel eventler için
      _mixpanel!.track(event.eventName, properties: properties);
      AppLogger.info('$serviceName: Generic event - ${event.eventName}');
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    if (!_isEnabled || _mixpanel == null) return;
    
    try {
      _mixpanel!.identify(userId);
      AppLogger.info('$serviceName: User ID set - $userId');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to set user ID: $e');
    }
  }

  @override
  Future<void> setUserProperty(String name, String value) async {
    if (!_isEnabled || _mixpanel == null) return;
    
    try {
      _mixpanel!.getPeople().set(name, value);
      AppLogger.info('$serviceName: User property set - $name: $value');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to set user property: $e');
    }
  }

  @override
  Future<void> disable() async {
    _isEnabled = false;
    try {
      _mixpanel?.optOutTracking();
      AppLogger.info('$serviceName disabled');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to disable: $e');
    }
  }

  @override
  Future<void> enable() async {
    _isEnabled = true;
    try {
      _mixpanel?.optInTracking();
      AppLogger.info('$serviceName enabled');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to enable: $e');
    }
  }
} 