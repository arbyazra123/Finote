import 'package:finote/shared/utility/int_ext.dart';
import 'package:flutter/services.dart';

class CurrencyRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  CurrencyRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // final oldValueConverted = oldValue.text.replaceAll("r'^[Rp.]'", "");
    final newValueConverted = newValue.text.replaceAll("r'^[Rp.]'", "");
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValueConverted) < min) {
      return const TextEditingValue().copyWith(
        text: min.toIdrFormat,
        selection: TextSelection.fromPosition(
          TextPosition(offset: min.toIdrFormat.length),
        ),
      );
    } else {
      return int.parse(newValueConverted) > max
          ? const TextEditingValue().copyWith(
              text: oldValue.text,
              selection: TextSelection.fromPosition(
                TextPosition(
                    offset: oldValue.text.length),
              ),
            )
          : const TextEditingValue().copyWith(
              text: int.parse(newValueConverted).toIdrFormat,
              selection: TextSelection.fromPosition(
                TextPosition(
                    offset: int.parse(newValueConverted).toIdrFormat.length),
              ),
            );
    }
  }
}
