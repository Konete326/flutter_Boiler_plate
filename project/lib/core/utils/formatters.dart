import 'package:intl/intl.dart';

class Formatters {
  static String date(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String currency(double amount) {
    return NumberFormat.currency(symbol: '$').format(amount);
  }

  static String time(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }
}
