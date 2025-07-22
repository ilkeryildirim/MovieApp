import '../analytics_helper.dart';
import '../events/user_events.dart';
import '../events/screen_events.dart';
import '../events/purchase_events.dart';

/*
/// Analytics kullanım örnekleri
class AnalyticsUsageExample {
  
  /// initializr
  static Future<void> initializeAnalytics() async {
    await Analytics.initialize(
      enableFirebase: true,
      enableMixpanel: true,
    );

    // await Analytics.initialize(
    //   enableFirebase: true,
    //   enableMixpanel: false,
    // );
  }

  static Future<void> onUserLogin() async {
    await Analytics.trackLogin('email');

    await Analytics.trackLogin('google', userId: 'user_123');

    await Analytics.setUserId('user_123');

    await Analytics.setUserProperty('subscription_type', 'premium');
    await Analytics.setUserProperty('user_level', '5');
  }

  static Future<void> onUserSignUp() async {
    await Analytics.trackSignUp('email', userId: 'user_456');
  }

  static Future<void> onScreenView() async {
    await Analytics.trackScreenView(
      'Home Screen',
      'HomePage',
      previousScreen: 'Login Screen',
      sessionDuration: const Duration(minutes: 2),
    );
  }

  static Future<void> onButtonClick() async {
    await Analytics.trackButtonClick(
      'login_button',
      'Login Screen',
      buttonType: 'primary',
      additionalData: {
        'login_method': 'email',
        'is_first_time': true,
      },
    );
  }

  static Future<void> onFeatureUsage() async {
    await Analytics.trackFeatureUsage(
      'photo_upload',
      'upload_started',
      'Profile Screen',
      metadata: {
        'file_size': '2.5MB',
        'file_type': 'jpg',
        'upload_method': 'camera',
      },
    );
  }
  static Future<void> onPurchase() async {
    final items = [
      PurchaseItem(
        itemId: 'premium_subscription',
        itemName: 'Premium Subscription',
        itemCategory: 'subscription',
        quantity: 1,
        price: 9.99,
        itemBrand: 'MyApp',
        itemVariant: 'monthly',
      ),
    ];

    await Analytics.trackPurchase(
      'txn_123456',
      9.99,
      'USD',
      items,
      couponCode: 'DISCOUNT10',
      tax: 0.89,
      shipping: 0.0,
    );
  }

  static Future<void> onAddToCart() async {
    await Analytics.trackAddToCart(
      'product_123',
      'Premium Feature',
      'digital_product',
      4.99,
      1,
      'USD',
    );
  }

  static Future<void> sendCustomEvent() async {
    final customEvent = CustomAnalyticsEvent(
      name: 'video_watched',
      parameters: {
        'video_id': 'video_123',
        'video_title': 'How to use our app',
        'watch_duration': 120,
        'completion_rate': 0.8,
      },
    );

    await Analytics.track(customEvent);
  }

  static Future<void> manageServices() async {
    final activeServices = Analytics.getActiveServices();
    print('Active services: $activeServices');

    final serviceStates = Analytics.getServiceStates();
    print('Service states: $serviceStates');

    await Analytics.toggleService('Firebase Analytics', false);

    await Analytics.setGlobalEnabled(false);

    await Analytics.setGlobalEnabled(true);
  }

  static Future<void> profilePageAnalytics() async {
    await Analytics.trackScreenView('Profile', 'ProfilePage');

    await Analytics.track(UserProfileUpdateEvent(
      userId: 'user_123',
      updatedFields: ['name', 'avatar', 'bio'],
    ));


    await Analytics.trackFeatureUsage(
      'photo_upload',
      'upload_completed',
      'Profile',
      metadata: {
        'success': true,
        'file_size': '1.2MB',
        'processing_time': '3.5s',
      },
    );
  }
}

class CustomAnalyticsEvent extends AnalyticsEvent {
  final String name;
  final Map<String, dynamic> params;

  CustomAnalyticsEvent({
    required this.name,
    required this.params,
  });

  @override
  String get eventName => name;

  @override
  Map<String, dynamic> get parameters => {
    ...params,
    'timestamp': timestamp.toIso8601String(),
  };
}

 */