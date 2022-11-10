import 'package:intl/intl.dart';

extension DateHelper on DateTime {
  String formatDate() {
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    final String formatted = formatter.format(this);
    return formatted;
  }
}
