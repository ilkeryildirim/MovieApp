import 'package:flutter/foundation.dart';

class AppLogger {
  static void info(String message, {Object? error}) {
    if (kDebugMode) {
      print('🔵 INFO: $message');
      if (error != null) {
        print('Error: $error');
      }
    }
  }

  static void error(String message, {Object? error}) {
    if (kDebugMode) {
      print('🔴 ERROR: $message');
      if (error != null) {
        print('Error: $error');
      }
    }
  }

  static void warning(String message, {Object? error}) {
    if (kDebugMode) {
      print('🟡 WARNING: $message');
      if (error != null) {
        print('Error: $error');
      }
    }
  }

  static void debug(String message, {Object? error}) {
    if (kDebugMode) {
      print('⚪ DEBUG: $message');
      if (error != null) {
        print('Error: $error');
      }
    }
  }
} 