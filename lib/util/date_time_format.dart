import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeFormat {
  static init() {
    initializeDateFormatting();
  }

  static String townFormat(DateTime dateTime) {
    return DateFormat('MM-dd(E)', 'ko').format(dateTime);
  }

  static String townCommentformat(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String townBookingDateformat(DateTime dateTime) {
    return DateFormat('MM월dd일(E)', 'ko').format(dateTime);
  }

  static String townBookingTimeformat(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }
}
