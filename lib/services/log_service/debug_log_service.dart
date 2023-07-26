import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:tiktok/services/log_service/log_service.dart';

@Singleton(as: LogService)
class DebugLogService implements LogService {
  DebugLogService() {
    _logger = Logger(
      printer: PrefixPrinter(
        PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 500,
          lineLength: 100,
        ),
      ),
      output: _MyConsoleOutput(),
    );
  }
  late final Logger _logger;

  @override
  void e(String message, dynamic e, StackTrace? stack) {
    _logger.e(message, e, stack);
  }

  @override
  void i(String message) {
    _logger.i(message);
  }

  @override
  void w(String message, [dynamic e, StackTrace? stack]) {
    _logger.w(message, e, stack);
  }
}

class _MyConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(developer.log);
  }
}
