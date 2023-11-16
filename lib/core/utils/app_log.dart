import 'package:logger/logger.dart';

class AppLog {
  final logger = Logger(
    printer: PrettyPrinter(),
  );
  void debug(String msg) {
    logger.d(msg);
  }

  void error(String msg) {
    logger.e(msg);
  }

  void info(String msg) {
    logger.i(msg);
  }

  void wtf(String msg) {
    logger.wtf(msg);
  }

  void warning(String msg) {
    logger.w(msg);
  }
}
