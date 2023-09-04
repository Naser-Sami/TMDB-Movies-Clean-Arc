import 'package:logger/logger.dart';

class LoggerDebug {
  static final Logger logger = Logger();

  static void loggerDebugMessage(dynamic msg) => logger.d(msg);
  static void loggerWarningMessage(dynamic msg) => logger.w(msg);
  static void loggerErrorMessage(dynamic msg) => logger.e(msg);
  static void loggerInformationMessage(dynamic msg) => logger.i(msg);
  static void loggerWTFMessage(dynamic msg) => logger.wtf(msg);
}