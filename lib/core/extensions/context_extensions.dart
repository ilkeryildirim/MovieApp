import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  
  // MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  bool get isKeyboardVisible => viewInsets.bottom > 0;
  
  // Orientation
  Orientation get orientation => mediaQuery.orientation;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;
  
  // Platform
  TargetPlatform get platform => theme.platform;
  bool get isIOS => platform == TargetPlatform.iOS;
  bool get isAndroid => platform == TargetPlatform.android;
  
  // Responsive helpers
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;
  bool get isDesktop => screenWidth >= 1200;
  
  // Navigation
  NavigatorState get navigator => Navigator.of(this);
  void pop<T>([T? result]) => navigator.pop(result);
  Future<T?> push<T>(Widget page) => navigator.push<T>(
    MaterialPageRoute(builder: (_) => page),
  );
  Future<T?> pushReplacement<T>(Widget page) => navigator.pushReplacement<T, void>(
    MaterialPageRoute(builder: (_) => page),
  );
  
  // SnackBar
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
      ),
    );
  }
  
  void showErrorSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: colorScheme.error,
      textColor: colorScheme.onError,
    );
  }
  
  void showSuccessSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }
  
  // Focus
  void unfocus() => FocusScope.of(this).unfocus();
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
  
  // Locale
  Locale get locale => Localizations.localeOf(this);
  bool get isRTL => Directionality.of(this) == TextDirection.rtl;
} 