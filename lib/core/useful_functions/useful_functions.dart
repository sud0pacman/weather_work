import 'package:intl/intl.dart';

String getFormattedDate() {
  DateTime now = DateTime.now();
  return DateFormat('MMMM dd').format(now);
}


String formatFullDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  DateFormat formatter = DateFormat('M/d/yyyy h:mm a');
  return formatter.format(dateTime);
}

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  DateFormat formatter = DateFormat('MMMM d');
  return formatter.format(dateTime);
}