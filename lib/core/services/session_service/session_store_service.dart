import 'package:alvi_automobiles/core/constants/app_constants.dart';
import 'package:alvi_automobiles/core/services/interface/service.dart';
import 'package:alvi_automobiles/data/models/auth/user.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionStoreService extends Service {
  static Future<SharedPreferences> storage() async =>
      await SharedPreferences.getInstance();
  static Future<void> storeSession(String session) async {
    try {
      await (await storage()).setString(AppConstants.sessionKey, session);
    } catch (e) {
      if (kDebugMode) {
        print("There was an error while storing the session ${e.toString()}");
      }
    }
  }

  static Future<String?> getSession() async {
    try {
      String? session = (await storage()).getString(AppConstants.sessionKey);
      return session;
    } catch (e) {
      if (kDebugMode) {
        print("There was an error while getting user session ${e.toString()}");
      }
    }
    return null;
  }

  static Future<void> storeUser(String user) async {
    try {
      await (await storage()).setString("user", user);
    } catch (e) {
      if (kDebugMode) {
        print("There was an error while getting user session ${e.toString()}");
      }
    }
  }

  static Future<User?> getUser() async {
    try {
      String? user = (await storage()).getString("user");
      return User.fromJson(user ?? "");
    } catch (e) {
      if (kDebugMode) {
        print("There was an error while getting user session ${e.toString()}");
      }
    }
    return null;
  }
}
