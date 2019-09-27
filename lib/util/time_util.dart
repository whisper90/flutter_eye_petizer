class TimeUtil {
  static String parseTimeFromDuration(int duration) {
    int hour = duration ~/ 3600;
    int minute = duration ~/ 60 % 60;
    int second = duration % 60;

    String twoDigitHour = twoDigits(hour);
    String twoDigitMinute = twoDigits(minute);
    String twoDigitSecond = twoDigits(second);

    if (hour <= 0) {
      return '$twoDigitMinute:$twoDigitSecond';
    } else {
      return '$twoDigitHour:$twoDigitMinute:$twoDigitSecond';
    }
  }

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}