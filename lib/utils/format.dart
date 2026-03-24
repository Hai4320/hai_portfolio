import 'package:intl/intl.dart';

String formatDownloads(int count) {
  // This provides localized, compact number formatting (e.g., 1K, 1.1M).
  return NumberFormat.compact().format(count);
}