abstract class NotificationUsecases {
  Future<void> scheduleNotification();
  Future<void> cancelNotification(String notificationId);
}
