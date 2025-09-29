import 'package:shared_preferences/shared_preferences.dart';

class UserCache {
  static bool isLoggedIn = false;
  static String? projectId;
  static Future<void> saveLogedIn({
    required bool login,
    required String projectId,
  }) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      isLoggedIn = login;
      await sharedPreferences.setBool('isLoggedIn', login);
      await sharedPreferences.setString('projectId', projectId);
    } on Exception catch (_) {
      isLoggedIn = false;
    }
  }

  static Future<bool> checkIsLoggedIn() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
      projectId = sharedPreferences.getString('projectId');
      return isLoggedIn;
    } catch (e) {
      return false;
    }
  }

  static Future<void> clear() async {
    try {
      (await SharedPreferences.getInstance()).clear();
    } on Exception catch (_) {}
  }
}
