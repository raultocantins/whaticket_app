import 'package:intl/intl.dart';

class UtilsDate {
  static String formatToHour(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static String formatToDayMonthYear(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatToHourMinute(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
