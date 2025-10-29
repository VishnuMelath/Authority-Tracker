import 'package:authority_tracker/utils/methods/capitalize_first_letter.dart';
import 'package:intl/intl.dart';

DateTime dateTimeFromString(String string) {
  var list = string.split('-');
  return DateTime(int.parse(list[2]), int.parse(list[1]), int.parse(list[0]));
}

String dateString(DateTime date) {
  return '${capitalizeFirst(month[date.month]!)} ${date.day}, ${date.year}';
}

String dateMonthYearString(DateTime date) {
  return '${capitalizeFirst(month[date.month]!)} ${date.year}';
}

String timeAgo(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inSeconds < 60) {
    return "${difference.inSeconds} seconds ago";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} minutes ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} hours ago";
  } else if (difference.inDays == 1) {
    return "Yesterday";
  } else if (difference.inDays == 2) {
    return "2 days ago";
  } else if (difference.inDays <= 7) {
    return "${difference.inDays} days ago";
  } else {
    return "on ${date.day} ${_monthName(date.month)}, ${date.year}";
  }
}

String formatDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final inputDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  if (inputDate == today) {
    // If the date is today, return only the time
    return DateFormat("h:mm a").format(dateTime).toLowerCase();
  } else if (inputDate == yesterday) {
    return 'Yesterday';
  } else {
    // If not today, format the date
    String month = _monthName(dateTime.month);
    if (dateTime.year == now.year) {
      return "${dateTime.day} $month"; // Exclude year if it's the current year
    } else {
      return "${dateTime.day} $month ${dateTime.year}"; // Include year if not current year
    }
  }
}

String _monthName(int month) {
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  return months[month - 1];
}

Map<int, String> month = {
  1: 'jan',
  2: 'feb',
  3: 'mar',
  4: 'apr',
  5: 'may',
  6: "june",
  7: 'july',
  8: 'aug',
  9: 'sept',
  10: 'oct',
  11: 'nov',
  12: 'dec',
};
