/// Khoảng thời gian theo (năm, tháng) — dùng để hiển thị "X yr Y mo".
/// Pure value object, không gọi `DateTime.now()` bên trong để dễ test.
class Tenure {
  final int years;
  final int months;

  const Tenure(this.years, this.months) : assert(years >= 0 && months >= 0 && months < 12);

  /// Tính tenure từ `start` đến `end`. Nếu `end` trước `start` → `Tenure(0, 0)`.
  ///
  /// Xử lý đúng cho end-of-month edge: vd start = Jan 31, end = Feb 28 (cuối
  /// tháng) vẫn được tính là đủ 1 tháng.
  factory Tenure.between(DateTime start, DateTime end) {
    if (end.isBefore(start)) return const Tenure(0, 0);
    var years = end.year - start.year;
    var months = end.month - start.month;
    final lastDayOfEndMonth = DateTime(end.year, end.month + 1, 0).day;
    final endIsLastDayOfMonth = end.day == lastDayOfEndMonth;
    if (end.day < start.day && !endIsLastDayOfMonth) months--;
    if (months < 0) {
      years--;
      months += 12;
    }
    return Tenure(years, months);
  }
}
