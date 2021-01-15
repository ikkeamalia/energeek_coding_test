import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtils {
  static String DATE_SLASH_FORMAT = "dd/MM/yyyy";
  static String DATE_COMMON_FORMAT = "dd MMMM yyyy";
  static String DATE_TIMEZONE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static String TIME_FORMAT = "HH:mm";
  static String DATETIME = "dd MMMM yyyy HH:mm";


  static String dateToString(DateTime time, String format) {
    if (time == null) return "";
    var formatter = DateFormat(format);
    String formatted = formatter.format(time);
    return formatted;
  }

  static String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat(TIME_FORMAT);
    return format.format(dt);
  }

  static TimeOfDay stringToTime(String s) {
    return TimeOfDay(
        hour: int.parse(s.split(":")[0]), minute: int.parse(s.split(":")[1]));
  }
}
