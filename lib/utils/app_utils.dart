import 'package:intl/intl.dart';

String getDate(String time, String toFormat) {
  try {
    DateTime dateTime = DateTime.parse(time);
    return DateFormat(toFormat).format(dateTime.toLocal());
  } catch (e) {
    print('TimeConverter: ${e.toString()}');
    return "";
  }
}
