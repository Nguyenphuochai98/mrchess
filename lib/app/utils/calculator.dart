import 'dart:math';

import 'package:intl/intl.dart';

int generateRandomCashBack() {
  Random random = Random();
  return random.nextInt(7) + 1;
}

String formatCurrency(double value) {
  return NumberFormat.currency(locale: 'vi', symbol: 'vnd').format(value);
}