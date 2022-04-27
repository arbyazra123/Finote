import 'package:intl/intl.dart';

extension IntExtension on int? {
  String get toIdrFormat =>
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0)
          .format(this ?? 0);

  int get orZero => this ?? 0;
}
