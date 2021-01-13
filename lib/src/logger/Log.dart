import 'dart:developer';

class Log {
  static LogLevel logLevel = LogLevel.VERBOSE;

  static bool logXmpp = true;

  Log(String tag, String message) {
    v(tag, message);
  }

  static void v(String tag, String message) {
    if (logLevel.index <= LogLevel.VERBOSE.index && logXmpp) {
      log('V/[$tag]: $message');
    }
  }

  static void d(String tag, String message) {
    if (logLevel.index <= LogLevel.DEBUG.index && logXmpp) {
      log('D/[$tag]: $message');
    }
  }

  static void i(String tag, String message) {
    if (logLevel.index <= LogLevel.INFO.index && logXmpp) {
      log('I/[$tag]: $message');
    }
  }

  static void w(String tag, String message) {
    if (logLevel.index <= LogLevel.WARNING.index && logXmpp) {
      log('W/[$tag]: $message');
    }
  }

  static void e(String tag, String message) {
    if (logLevel.index <= LogLevel.ERROR.index && logXmpp) {
      log('E/[$tag]: $message');
    }
  }

  static void xmppp_receiving(String message) {
    if (logXmpp) {
      log('---Xmpp Receiving:---');
      log('$message');
    }
  }

  static void xmppp_sending(String message) {
    if (logXmpp) {
      log('---Xmpp Sending:---');
      log('$message');
    }
  }
}

enum LogLevel { VERBOSE, DEBUG, INFO, WARNING, ERROR, OFF }
