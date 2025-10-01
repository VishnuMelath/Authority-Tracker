import 'dart:convert';

import 'package:authority_tracker/data/data_sources/one_signal.dart';
import 'package:authority_tracker/data/data_sources/user_cache.dart';
import 'package:authority_tracker/domain/models/permits_model.dart';
import 'package:http/http.dart';

class NotificationServices {
  static const baseUrl = 'https://api.onesignal.com/notifications';
  Future<void> createNotification({required PermitsModel permit}) async {
    await post(
      Uri.parse('$baseUrl?c=push'),
      body: jsonEncode({
        {
          "app_id": OneSignalCredentials.appId,
          "include_aliases": {
            "external_id": ["${UserCache.projectId}"],
          },
          "target_channel": "push",
          "contents": {"en": "Permit expiring"},
          "headings": {"en": "${permit.name} is expiring today"},
          "small_icon": "ic_stat_onesignal",
          "send_after": permit.expiryDate.toIso8601String(),
        },
      }),
    );
  }

  Future<void> cancelNotification(String notificationId) async {
    try {
      await delete(
        Uri.parse(
          '$baseUrl/$notificationId?app_id=${OneSignalCredentials.appId}',
        ),
      );
    } catch (_) {
      rethrow;
    }
  }
}
