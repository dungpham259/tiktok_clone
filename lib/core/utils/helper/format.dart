import 'package:intl/intl.dart';

class Format {
  static String hours(double hours) {
    final hoursNotNegative = hours < 0.0 ? 0.0 : hours;
    final formatter = NumberFormat.decimalPattern();
    final formatted = formatter.format(hoursNotNegative);
    return '${formatted}h';
  }

  static String date(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  static String dayOfWeek(DateTime date) {
    return DateFormat.E().format(date);
  }

  static String currency(double pay) {
    if (pay != 0.0) {
      final formatter = NumberFormat.simpleCurrency(decimalDigits: 0);
      return formatter.format(pay);
    }
    return '';
  }

  static String formatCountNumber(int number) {
    if (number >= 1000000) {
      double value = number / 1000000;
      return value.toStringAsFixed(1) + 'M';
    } else if (number >= 1000) {
      double value = number / 1000;
      return value.toStringAsTruncated(1) + 'K';
    } else {
      return number.toString();
    }
  }
}

extension on double {
  // Like [toStringAsFixed] but truncates (toward zero) to the specified
  // number of fractional digits instead of rounding.
  String toStringAsTruncated(int fractionDigits) {
    // Require same limits as [toStringAsFixed].
    assert(fractionDigits >= 0);
    assert(fractionDigits <= 20);

    if (fractionDigits == 0) {
      return truncateToDouble().toString();
    }

    // [toString] will represent very small numbers in exponential form.
    // Instead use [toStringAsFixed] with the maximum number of fractional
    // digits.
    var s = toStringAsFixed(20);

    // [toStringAsFixed] will still represent very large numbers in
    // exponential form.
    if (s.contains('e')) {
      // Ignore values in exponential form.
      return s;
    }

    // Ignore unrecognized values (e.g. NaN, +infinity, -infinity).
    var i = s.indexOf('.');
    if (i == -1) {
      return s;
    }

    return s.substring(0, i + fractionDigits + 1);
  }
}
