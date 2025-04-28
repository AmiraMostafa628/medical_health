import 'package:flutter/services.dart';

class FormatCardNumber extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'\D'),
        ''); //regular expression (regex) to remove all non-digit characters from the text.
    String formatText = '';

    if (newText.length > 11) {
      newText = newText.substring(0, 11);
    }
    for (int i = 0; i < newText.length; i++) {
      if (i % 3 == 0 && i != 0) {
        formatText += ' ';
      }
      formatText += newText[i];
    }
    return TextEditingValue(
        text: formatText,
        selection: TextSelection.collapsed(offset: formatText.length)
        //sets the cursor to be at the end of the newly formatted text in the TextField
        );
  }
}
