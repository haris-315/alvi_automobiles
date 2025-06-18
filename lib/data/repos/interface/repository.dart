import 'dart:developer';

abstract class Repository {
  init() {
    log("Repository Initialized...", name: runtimeType.toString());
  }
}
