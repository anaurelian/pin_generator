import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pingenerator/utils/strings.dart';

extension RandomOfDigits on Random {
  /// Generates a non-negative random integer with a specified number of digits.
  ///
  /// Supports [digitCount] values between 1 and 9 inclusive.
  int nextIntOfDigits(int digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    int min = digitCount == 1 ? 0 : pow(10, digitCount - 1);
    int max = pow(10, digitCount);
    return min + nextInt(max - min);
  }
}

/// Shows a [SnackBar] at the bottom of the specified scaffold.
void showSnackBar(ScaffoldState scaffoldState, String text) {
  scaffoldState.showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

/// Stores the given text on the clipboard, and shows a [SnackBar] on success.
Future<void> copyToClipboard(ScaffoldState scaffoldState, String text) async {
  try {
    await Clipboard.setData(ClipboardData(text: text));
    showSnackBar(scaffoldState, Strings.copiedMessage);
  } catch (error) {
    print('${Strings.copiedError} $error');
  }
}
