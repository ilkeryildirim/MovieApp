import 'analytics_dispatcher.dart';
import 'events/analytics_event.dart';
import 'events/user_events.dart';
import 'events/screen_events.dart';
import 'events/purchase_events.dart';

/// Global analytics helper functions
class Analytics {
  static final AnalyticsDispatcher _dispatcher = AnalyticsDispatcher();

  /// Initialize analytics services
  static Future<void> initialize({
    bool enableFirebase = true,
    bool enableMixpanel = true,
  }) async {
    await _dispatcher.initialize(
      enableFirebase: enableFirebase,
      enableMixpanel: enableMixpanel,
    );
  }

  /// Track any custom event
  static Future<void> track(AnalyticsEvent event) async {
    await _dispatcher.trackEvent(event);
  }

  /// Quick helper methods for common events

  /// Track user login
  static Future<void> trackLogin(String method, {String? userId}) async {
    await track(UserLoginEvent(method: method, userId: userId));
  }

  /// Track user sign up
  static Future<void> trackSignUp(String method, {String? userId}) async {
    await track(UserSignUpEvent(method: method, userId: userId));
  }

  /// Track screen view
  static Future<void> trackScreenView(
    String screenName,
    String screenClass, {
    String? previousScreen,
    Duration? sessionDuration,
  }) async {
    await track(ScreenViewEvent(
      screenName: screenName,
      screenClass: screenClass,
      previousScreen: previousScreen,
      sessionDuration: sessionDuration,
    ));
  }

  /// Track button click
  static Future<void> trackButtonClick(
    String buttonName,
    String screenName, {
    String? buttonType,
    Map<String, dynamic>? additionalData,
  }) async {
    await track(ButtonClickEvent(
      buttonName: buttonName,
      screenName: screenName,
      buttonType: buttonType,
      additionalData: additionalData,
    ));
  }

  /// Track feature usage
  static Future<void> trackFeatureUsage(
    String featureName,
    String action,
    String screenName, {
    Map<String, dynamic>? metadata,
  }) async {
    await track(FeatureUsageEvent(
      featureName: featureName,
      action: action,
      screenName: screenName,
      metadata: metadata,
    ));
  }

  /// Track purchase
  static Future<void> trackPurchase(
    String transactionId,
    double value,
    String currency,
    List<PurchaseItem> items, {
    String? couponCode,
    double? tax,
    double? shipping,
  }) async {
    await track(PurchaseEvent(
      transactionId: transactionId,
      value: value,
      currency: currency,
      items: items,
      couponCode: couponCode,
      tax: tax,
      shipping: shipping,
    ));
  }

  /// Track add to cart
  static Future<void> trackAddToCart(
    String itemId,
    String itemName,
    String itemCategory,
    double price,
    int quantity,
    String currency,
  ) async {
    await track(AddToCartEvent(
      itemId: itemId,
      itemName: itemName,
      itemCategory: itemCategory,
      price: price,
      quantity: quantity,
      currency: currency,
    ));
  }

  /// Set user ID
  static Future<void> setUserId(String userId) async {
    await _dispatcher.setUserId(userId);
  }

  /// Set user property
  static Future<void> setUserProperty(String name, String value) async {
    await _dispatcher.setUserProperty(name, value);
  }

  /// Enable/disable specific analytics service
  static Future<void> toggleService(String serviceName, bool enabled) async {
    await _dispatcher.toggleService(serviceName, enabled);
  }

  /// Enable/disable all analytics globally
  static Future<void> setGlobalEnabled(bool enabled) async {
    await _dispatcher.setGlobalEnabled(enabled);
  }

  /// Get active services
  static List<String> getActiveServices() {
    return _dispatcher.getActiveServices();
  }

  /// Get all service states
  static Map<String, bool> getServiceStates() {
    return _dispatcher.getServiceStates();
  }

  /// Check if analytics is globally enabled
  static bool get isEnabled => _dispatcher.isGloballyEnabled;
} 