import 'package:intl/intl.dart';

extension NumberFormatting on String {
  String get withThousandsSeparator => formatNumberWithThousandsSeparator(this);
}

String formatNumberWithThousandsSeparator(String number) {
  final result = int.parse(number.split('.').join(''));
  return NumberFormat('#,###').format(result);
}
