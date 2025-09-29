import 'package:shared_preferences/shared_preferences.dart';

class UserCache {
  static bool isLoggedIn = false;
  Future<void> saveLogedIn(bool login) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      isLoggedIn = login;
      await sharedPreferences.setBool('isLoggedIn', login);
    } on Exception catch (_) {
      isLoggedIn = false;
    }
  }

  Future<bool> checkIsLoggedIn() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
      return isLoggedIn;
    } catch (e) {
      return false;
    }
  }

  Future<void> clear() async {
    try {
      (await SharedPreferences.getInstance()).clear();
    } on Exception catch (_) {}
  }
}
