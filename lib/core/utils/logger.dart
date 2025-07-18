import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppLogger {
  late final Logger _logger;
  
  AppLogger() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );
  }
  
  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
  
  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.i(message, time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
  
  void warning(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.w(message, time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
  
  void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
  
  void verbose(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.t(message, time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
  
  void wtf(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.f(message, time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
} 