import 'package:get/get.dart';
import 'package:intl/intl.dart';

String dateTimeFormat(DateTime dateTime) {
  return DateFormat(
    'dd/MM/yyyy',
    Get.locale.toString(),
  ).format(
    dateTime.toLocal(),
  );
}
