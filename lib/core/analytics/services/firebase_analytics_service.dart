import 'package:firebase_analytics/firebase_analytics.dart';
import '../analytics_service.dart';
import '../events/analytics_event.dart';
import '../events/user_events.dart';
import '../events/screen_events.dart';
import '../events/purchase_events.dart';
import '../../utils/logger.dart';

class FirebaseAnalyticsService implements AnalyticsService {
  static final FirebaseAnalyticsService _instance = FirebaseAnalyticsService._internal();
  factory FirebaseAnalyticsService() => _instance;
  FirebaseAnalyticsService._internal();

  FirebaseAnalytics? _analytics;
  bool _isEnabled = true;

  @override
  String get serviceName => 'Firebase Analytics';

  @override
  bool get isEnabled => _isEnabled;

  @override
  Future<void> initialize() async {
    try {
      _analytics = FirebaseAnalytics.instance;
      await _analytics?.setAnalyticsCollectionEnabled(_isEnabled);
      AppLogger.info('$serviceName initialized successfully');
    } catch (e) {
      AppLogger.error('Failed to initialize $serviceName: $e');
    }
  }

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    if (!_isEnabled || _analytics == null) return;
    
    try {
      // Spesifik event tipine göre Firebase Analytics'e gönder
      if (event is UserLoginEvent) {
        await _analytics!.logLogin(loginMethod: event.method);
      } else if (event is UserSignUpEvent) {
        await _analytics!.logSignUp(signUpMethod: event.method);
      } else if (event is ScreenViewEvent) {
        await _analytics!.logScreenView(
          screenName: event.screenName,
          screenClass: event.screenClass,
        );
      } else if (event is PurchaseEvent) {
        await _analytics!.logPurchase(
          transactionId: event.transactionId,
          value: event.value,
          currency: event.currency,
          items: event.items.map((item) => AnalyticsEventItem(
            itemId: item.itemId,
            itemName: item.itemName,
            itemCategory: item.itemCategory,
            quantity: item.quantity,
            price: item.price,
          )).toList(),
        );
      } else if (event is AddToCartEvent) {
        await _analytics!.logAddToCart(
          currency: event.currency,
          value: event.price * event.quantity,
          items: [
            AnalyticsEventItem(
              itemId: event.itemId,
              itemName: event.itemName,
              itemCategory: event.itemCategory,
              quantity: event.quantity,
              price: event.price,
            )
          ],
        );
      } else {
        // Genel eventler için
        final Map<String, Object> firebaseParameters = event.parameters.map(
          (key, value) => MapEntry(key, value?.toString() ?? ''),
        );
        
        await _analytics!.logEvent(
          name: event.eventName,
          parameters: firebaseParameters,
        );
      }
      
      AppLogger.info('$serviceName: Event tracked - ${event.eventName}');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to track event ${event.eventName}: $e');
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    if (!_isEnabled || _analytics == null) return;
    
    try {
      await _analytics!.setUserId(id: userId);
      AppLogger.info('$serviceName: User ID set - $userId');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to set user ID: $e');
    }
  }

  @override
  Future<void> setUserProperty(String name, String value) async {
    if (!_isEnabled || _analytics == null) return;
    
    try {
      await _analytics!.setUserProperty(name: name, value: value);
      AppLogger.info('$serviceName: User property set - $name: $value');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to set user property: $e');
    }
  }



  @override
  Future<void> disable() async {
    _isEnabled = false;
    try {
      await _analytics?.setAnalyticsCollectionEnabled(false);
      AppLogger.info('$serviceName disabled');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to disable: $e');
    }
  }

  @override
  Future<void> enable() async {
    _isEnabled = true;
    try {
      await _analytics?.setAnalyticsCollectionEnabled(true);
      AppLogger.info('$serviceName enabled');
    } catch (e) {
      AppLogger.error('$serviceName: Failed to enable: $e');
    }
  }
} 