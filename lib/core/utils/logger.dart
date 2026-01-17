import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error, fatal }

class Logger {
  Logger(this._className);

  /// Factory constructor for creating named loggers
  factory Logger.forClass(Type type) => Logger(type.toString());
  final String _className;
  static bool _enableLogs = kDebugMode; // Only log in debug mode by default
  static LogLevel _minimumLogLevel = LogLevel.debug;

  /// Configure global logger settings
  static void configure({bool? enableLogs, LogLevel? minimumLogLevel}) {
    if (enableLogs != null) _enableLogs = enableLogs;
    if (minimumLogLevel != null) _minimumLogLevel = minimumLogLevel;
  }

  /// Debug level - for detailed debugging information
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.debug, message, error, stackTrace);
  }

  /// Info level - for general informational messages
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.info, message, error, stackTrace);
  }

  /// Warning level - for potentially harmful situations
  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.warning, message, error, stackTrace);
  }

  /// Error level - for error events
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.error, message, error, stackTrace);
  }

  /// Fatal level - for very severe error events
  void fatal(String message, [Object? error, StackTrace? stackTrace]) {
    _log(LogLevel.fatal, message, error, stackTrace);
  }

  void _log(
    LogLevel level,
    String message,
    Object? error,
    StackTrace? stackTrace,
  ) {
    if (!_enableLogs || level.index < _minimumLogLevel.index) return;

    final timestamp = DateTime.now().toIso8601String();
    final levelStr = level.name.toUpperCase().padRight(7);
    final emoji = _getEmoji(level);

    // Format: [TIMESTAMP] EMOJI LEVEL | ClassName | Message
    final logMessage = '[$timestamp] $emoji $levelStr | $_className | $message';

    if (kDebugMode) {
      // Use debugPrint to avoid truncation in debug mode
      debugPrint(logMessage);

      if (error != null) {
        debugPrint('  └─ Error: $error');
      }

      if (stackTrace != null) {
        debugPrint('  └─ StackTrace:\n$stackTrace');
      }
    } else {
      // In release mode, you might want to send logs to a service
      // like Firebase Crashlytics, Sentry, etc.
      _sendToLoggingService(level, logMessage, error, stackTrace);
    }
  }

  String _getEmoji(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return '🔍';
      case LogLevel.info:
        return 'ℹ️';
      case LogLevel.warning:
        return '⚠️';
      case LogLevel.error:
        return '❌';
      case LogLevel.fatal:
        return '💀';
    }
  }

  void _sendToLoggingService(
    LogLevel level,
    String message,
    error,
    StackTrace? stackTrace,
  ) {
    // TODO: Implement your logging service integration
    // Examples:
    // - Firebase Crashlytics: FirebaseCrashlytics.instance.log(message)
    // - Sentry: Sentry.captureMessage(message)
    // - Custom backend API
  }
}

// Extension for easy logger creation
extension LoggerExtension on Object {
  Logger get logger => Logger.forClass(runtimeType);
}
