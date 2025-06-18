import 'dart:developer';

abstract class Service {
  void logToConsole(String msg, Type rt) {
    log(msg, name: rt.toString());
  }
}
