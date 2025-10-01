import 'package:authority_tracker/data/data_sources/user_cache.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationController {
  Future sendNotification() async {}
  Future<void> login() async {
    try {
      await logout();
      await OneSignal.login(UserCache.projectId!);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await OneSignal.logout();
    } on Exception catch (_) {
      rethrow;
    }
  }
}
